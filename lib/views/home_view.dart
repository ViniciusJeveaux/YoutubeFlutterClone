import 'package:flutter/material.dart';
import 'package:youtube_clone/API/api.dart';
import 'package:youtube_clone/model/video.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  _listVideos(){
    Future <List<Video>> videos;
    Api api = Api();
    videos = api.search("");
    return videos;

  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listVideos(),
      builder: (contex, snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context, index){
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.thumbnails)
                            )
                          ),
                        ),
                        ListTile(
                            title: Text(video.title),
                          subtitle: Text(video.channelTitle),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index){
                    return Divider(height: 2, color: Colors.grey);
              },
                  itemCount: snapshot.data.length
              );


          }else{
              return Center(
              child: Text("Nenhum video a ser exibido"),
              );
          }
            break;

        }

      },
    );
  }
}
