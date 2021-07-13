import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:medico/apis/encoding_provider.dart';
import 'package:medico/apis/firebase_provider.dart';
import 'package:path/path.dart' as p;
import 'package:medico/models/video_info.dart';
import 'package:medico/widgets/player.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:http/http.dart' as http;
import 'package:medico/config/app_config.dart' as config;

class Video {
  final int id;
  final String videoName;

  Video({this.id, this.videoName});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      videoName: json['VideoName'],
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Knowledgehub extends StatefulWidget {
  Knowledgehub({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KnowledgehubState createState() => _KnowledgehubState();
}

class _KnowledgehubState extends State<Knowledgehub> {
  final thumbWidth = 100;
  final thumbHeight = 150;
  List<VideoInfo> _videos = <VideoInfo>[];
  bool _imagePickerActive = false;
  bool _processing = false;
  bool _canceled = false;
  double _progress = 0.0;
  int _videoDuration = 0;
  String _processPhase = '';
  final bool _debugMode = false;
  String folderN = '';
  Future<Video> sendVidName;
  @override
  void initState() {
    FirebaseProvider.listenTokVideos((newVideos) {
      setState(() {
        _videos = newVideos;
      });
    });

    EncodingProvider.enableStatisticsCallback((int time,
        int size,
        double bitrate,
        double speed,
        int videoFrameNumber,
        double videoQuality,
        double videoFps) {
      if (_canceled) return;

      setState(() {
        _progress = time / _videoDuration;
      });
    });

    super.initState();
  }

  void _onUploadProgress(event) {
    if (event.type == StorageTaskEventType.progress) {
      final double progress =
          event.snapshot.bytesTransferred / event.snapshot.totalByteCount;
      setState(() {
        _progress = progress;
      });
    }
  }

  Future<bool> deleteVideo(id) async {
    var userUID = FirebaseAuth.instance.currentUser.uid;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .collection('videos')
        .doc(id)
        .delete();
    await FirebaseStorage.instance.ref().child('$userUID/$folderN').delete();
    return true;
  }

  Future<String> _uploadFile(filePath, folderName) async {
    final file = new File(filePath);
    final basename = p.basename(filePath);
    folderN = folderName;

    var userUID = FirebaseAuth.instance.currentUser.uid;
    final StorageReference ref = FirebaseStorage.instance
        .ref()
        .child('admin@mindtimeteam.com')
        .child(folderName)
        .child(basename);
    print('folder name = ' + folderName);
    print('base name = ' + basename);
    StorageUploadTask uploadTask = ref.putFile(file);
    uploadTask.events.listen(_onUploadProgress);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String videoUrl = await taskSnapshot.ref.getDownloadURL();
    return videoUrl;
  }

  String getFileExtension(String fileName) {
    final exploded = fileName.split('.');
    return exploded[exploded.length - 1];
  }

  void _updatePlaylistUrls(File file, String videoName) {
    final lines = file.readAsLinesSync();
    var userUID = FirebaseAuth.instance.currentUser.uid;
    var updatedLines = List<String>();

    for (final String line in lines) {
      var updatedLine = line;
      if (line.contains('.ts') || line.contains('.m3u8')) {
        updatedLine = '$userUID%2F$videoName%2F$line?alt=media';
      }
      updatedLines.add(updatedLine);
    }
    final updatedContents =
        updatedLines.reduce((value, element) => value + '\n' + element);

    file.writeAsStringSync(updatedContents);
  }

  Future<String> _uploadHLSFiles(dirPath, videoName) async {
    final videosDir = Directory(dirPath);

    var playlistUrl = '';

    final files = videosDir.listSync();
    int i = 1;
    for (FileSystemEntity file in files) {
      final fileName = p.basename(file.path);
      final fileExtension = getFileExtension(fileName);
      if (fileExtension == 'm3u8') _updatePlaylistUrls(file, videoName);

      setState(() {
        _processPhase = 'Uploading video file $i out of ${files.length}';
        _progress = 0.0;
      });

      final downloadUrl = await _uploadFile(file.path, videoName);

      if (fileName == 'master.m3u8') {
        playlistUrl = downloadUrl;
      }
      i++;
    }

    return playlistUrl;
  }

  Future<void> _processVideo(File rawVideoFile) async {
    final String rand = '${new Random().nextInt(10000)}';
    final videoName = 'video$rand';
    final mp4 = '.mp4';
    final videoNameF = '$videoName$mp4';
    String email;

    final StorageReference ref =
        FirebaseStorage.instance.ref().child('RawVideos').child(videoNameF);
    StorageUploadTask uploadTask = ref.putFile(rawVideoFile);
    uploadTask.events.listen(_onUploadProgress);
    final Directory extDir = await getApplicationDocumentsDirectory();
    final outDirPath = '${extDir.path}/Videos/$videoName';
    final videosDir = new Directory(outDirPath);
    videosDir.createSync(recursive: true);

    final rawVideoPath = rawVideoFile.path;
    final copyPath = '$outDirPath/copy.mp4';
    File(rawVideoPath).copySync(copyPath);

    final info = await EncodingProvider.getMediaInformation(copyPath);
    final aspectRatio = EncodingProvider.getAspectRatio(info);
    setState(() {
      _processPhase = 'Generating thumbnail';
      _videoDuration = EncodingProvider.getDuration(info);
      _progress = 0.0;
    });

    final thumbFilePath = await EncodingProvider.getThumb(
        copyPath, outDirPath, thumbWidth, thumbHeight);

    setState(() {
      _processPhase = 'Encoding video';
      _progress = 0.0;
    });

    final encodedFilesDir =
        await EncodingProvider.encodeHLS(copyPath, outDirPath);

    File(copyPath).deleteSync();

    setState(() {
      _processPhase = 'Uploading thumbnail to firebase storage';
      _progress = 0.0;
    });
    final thumbUrl = await _uploadFile(thumbFilePath, 'thumbnail');
    final videoUrl = await _uploadHLSFiles(encodedFilesDir, videoName);

    final videoInfo = VideoInfo(
      videoUrl: videoUrl,
      thumbUrl: thumbUrl,
      coverUrl: thumbUrl,
      aspectRatio: aspectRatio,
      uploadedAt: DateTime.now().millisecondsSinceEpoch,
      videoName: videoName,
    );

    setState(() {
      _processPhase = 'Saving video metadata to cloud firestore';
      _progress = 0.0;
    });

    await FirebaseProvider.saveVideo(videoInfo);

    setState(() {
      _processPhase = '';
      _progress = 0.0;
      _processing = false;
    });
    Future<VideoInfo> sendVidToRestAPI(String vidName, String email) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      email = prefs.getString('email');
      print("Email in SendVidToRestAPI " + email);

      var videoEnc = jsonEncode(<String, String>{
        'Video Name': vidName,
      });
      print('REST API: ' + videoEnc);

      final response = await http.post(Uri.http(
          '143.198.113.232', '' + vidName + "-" + email + "-" + 'Video'));
      if (response.statusCode == 200) {
        Video.fromJson(jsonDecode(response.body));
      } else {
        // return Album.fromJson(jsonDecode(response.body));
        throw Exception(response.body);
      }
    }

    sendVidToRestAPI(videoName, email);
  }

  void _takeVideo() async {
    var videoFile;
    if (_debugMode) {
      videoFile = File(
          '/storage/emulated/0/Android/data/com.learningsomethingnew.fluttervideo.flutter_video_sharing/files/Pictures/ebbafabc-dcbe-433b-93dd-80e7777ee4704451355941378265171.mp4');
    } else {
      if (_imagePickerActive) return;

      _imagePickerActive = true;
      videoFile = await ImagePicker.pickVideo(source: ImageSource.gallery);
      _imagePickerActive = false;

      if (videoFile == null) return;
    }
    setState(() {
      _processing = true;
    });

    try {
      await _processVideo(videoFile);
    } catch (e) {
      print('${e.toString()}');
    } finally {
      setState(() {
        _processing = false;
      });
    }
  }

  _getListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _videos.length,
        itemBuilder: (BuildContext context, int index) {
          final video = _videos[index];
          return ListTile(
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Player(
                        video: video,
                      );
                    },
                  ),
                );
              },
              child: Card(
                child: new Container(
                  padding: new EdgeInsets.all(10.0),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                width: thumbWidth.toDouble(),
                                height: thumbHeight.toDouble(),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                              ClipRRect(
                                borderRadius: new BorderRadius.circular(8.0),
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: video.thumbUrl,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin: new EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text("${video.videoName}"),
                                  Container(
                                    margin: new EdgeInsets.only(top: 12.0),
                                    child: Text(
                                        'Uploaded ${timeago.format(new DateTime.fromMillisecondsSinceEpoch(video.uploadedAt))}'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  _getProgressBar() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            child: Text(_processPhase),
          ),
          LinearProgressIndicator(
            value: _progress,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KnowledgeHub"),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            /*
            Navigator.of(context).pushNamed('/home',
                arguments: [widget.currentUser.name, widget.currentUser.email]);*/
          },
        ),
        backgroundColor: config.Colors().mainDarkColor(1),
      ),
      body: Center(child: _processing ? _getProgressBar() : _getListView()),
    );
  }
}
