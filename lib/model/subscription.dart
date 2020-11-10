class Subscription{
  String id;
  String title;
  String description;
  String channelId;
  String thumbnails;

  Subscription(
      {this.id, this.title, this.description, this.channelId, this.thumbnails});

  factory Subscription.fromJson(Map<String, dynamic> json){
    return Subscription(
     id: json["videoId"],
      title: json["snippet"]["title"],
      description: json["snippet"]["description"],
      thumbnails: json["snippet"]["thumbnails"]["high"]["url"],
      channelId: json["snippet"]["resourceId"]["channelId"],
    );

  }
}

