import 'package:flutter/material.dart';
import 'package:youtube_clone/views/home_view.dart' as prefix0;
import 'package:youtube_clone/views/library_view.dart';
import 'package:youtube_clone/views/subscriptions_view.dart';
import 'package:youtube_clone/views/trends_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex= 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      prefix0.HomeView(),
      Trends(),
      Subscriptions(),
      Library(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed:(){} ,
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed:(){} ,
          )
        ],

      ),
      body: Container(
        padding: EdgeInsets.all(16),
          child: views[_currentIndex],
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });


        },
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home)
          ),

          BottomNavigationBarItem(
              title: Text("Trends"),
              icon: Icon(Icons.whatshot)
          ),

          BottomNavigationBarItem(
              title: Text("Subscriptions"),
              icon: Icon(Icons.subscriptions)
          ),

          BottomNavigationBarItem(
              title: Text("Library"),
              icon: Icon(Icons.folder)
          )
        ],
      ),
    );
  }
}
