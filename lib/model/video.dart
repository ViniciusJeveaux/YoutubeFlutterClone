
class Video{
  String videoId;
  String title;
  String description;
  String thumbnails;
  String publishedAt;
  String channelTitle;

  Video({this.videoId, this.title, this.description, this.thumbnails,
      this.publishedAt, this.channelTitle});


  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
        videoId: json["id"]["videoId"],
        title: json["snippet"]["title"],
        description: json["snippet"]["description"],
        thumbnails: json["snippet"]["thumbnails"]["high"]["url"],
        publishedAt: json["snippet"]["publishedAt"],
        channelTitle: json["snippet"]["channelTitle"],
    );

  }

}