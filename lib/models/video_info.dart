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
  factory VideoInfo.fromJson(Map<String, dynamic> json) {
    return VideoInfo(
      videoName: json['videoName'],
    );
  }
}
