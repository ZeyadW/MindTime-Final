import 'package:http/http.dart';

class VideoInfo {
  String videoUrl;
  String thumbUrl;
  String coverUrl;
  double aspectRatio;
  int uploadedAt;
  String videoName;
  String id;
  Response sendAPI;

  VideoInfo(
      {this.videoUrl,
      this.thumbUrl,
      this.coverUrl,
      this.aspectRatio,
      this.uploadedAt,
      this.id,
      this.sendAPI,
      this.videoName});
}
