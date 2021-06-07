import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:medico/models/video_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProvider {
  static saveVideo(VideoInfo video) async {
    //var userUID = FirebaseAuth.instance.currentUser.uid;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .collection('videos')
        .doc()
        .set({
      'videoUrl': video.videoUrl,
      'thumbUrl': video.thumbUrl,
      'coverUrl': video.coverUrl,
      'aspectRatio': video.aspectRatio,
      'uploadedAt': video.uploadedAt,
      'videoName': video.videoName,
    });
  }

  static listenToVideos(callback) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .collection('videos')
        .snapshots()
        .listen((qs) {
      final videos = mapQueryToVideoInfo(qs);
      callback(videos);
    });
  }

  static mapQueryToVideoInfo(QuerySnapshot qs) {
    return qs.docs.map((DocumentSnapshot ds) {
      return VideoInfo(
        videoUrl: ds.data()['videoUrl'],
        thumbUrl: ds.data()['thumbUrl'],
        coverUrl: ds.data()['coverUrl'],
        aspectRatio: ds.data()['aspectRatio'],
        id: ds.id,
        videoName: ds.data()['videoName'],
        uploadedAt: ds.data()['uploadedAt'],
      );
    }).toList();
  }
}
