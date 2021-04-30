class VideoInfo {
  String videoUrl;
  String thumbUrl;
  String coverUrl;
  double aspectRatio;
  int uploadedAt;
  String videoName;
  String id;

  VideoInfo(
      {this.videoUrl,
      this.thumbUrl,
      this.coverUrl,
      this.aspectRatio,
      this.uploadedAt,
      this.id,
      this.videoName});
<<<<<<< HEAD
=======
  factory VideoInfo.fromJson(Map<String, dynamic> json) {
    return VideoInfo(
      videoName: json['videoName'],
    );
  }
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
}
