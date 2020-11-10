import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_clone/model/video.dart';
import 'package:youtube_clone/model/subscription.dart';
import 'package:youtube_clone/views/subscriptions_view.dart';
const YOUTUBE_KEY = "AIzaSyDuRunXhlse0FWRy6bAHdj4PMx8dGFmoBE";
const CHANNEL_ID = "UCu5o3EIRHdWiWxQD2m-VD2Q";
const URL_API = "https://www.googleapis.com/youtube/v3/";

class Api{
  Future <List<Video>> search(String query) async {
    http.Response response = await http.get(
        URL_API + "search"
            "?" + "part=snippet" +
            "&channelId=$CHANNEL_ID" +
            "&maxResults=15" +
            "&order=date" +
            "&type=video" +
            "&key=$YOUTUBE_KEY"
            "&q=$query"
    );
    if ( response.statusCode == 200){
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Video> videos = jsonData["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();
      return videos;
    }else
      print("Status api" + response.statusCode.toString());
  }


  Future <List<Video>> moreWatch() async {
    http.Response response = await http.get(
        URL_API + "search"
            "?" + "part=snippet" +
            "&channelId=$CHANNEL_ID" +
            "&maxResults=20" +
            "&order=viewCount" +
            "&type=video" +
            "&key=$YOUTUBE_KEY"

    );
    if ( response.statusCode == 200){
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Video> videos = jsonData["items"].map<Video>(
              (map){
            return Video.fromJson(map);
          }
      ).toList();
      return videos;
    }else
      print("Status api" + response.statusCode.toString());
  }

  Future <List<Subscription>> subs() async {
    http.Response response = await http.get(
        URL_API + "subscriptions"
            "?" + "part=snippet" +
            "&channelId=$CHANNEL_ID" +
            "&maxResults=40" +
            "&order=unread" +
            "&key=$YOUTUBE_KEY"

    );
    if ( response.statusCode == 200){
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Subscription> subscriptions = jsonData["items"].map<Subscription>(
              (map){
            return Subscription.fromJson(map);
          }
      ).toList();
      print("Status api" + response.statusCode.toString());
      return subscriptions;
    }else
      print("Status api" + response.statusCode.toString());
  }

}
