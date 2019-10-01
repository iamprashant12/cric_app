import 'package:cricket_app/screens/home.dart';
import 'package:cricket_app/screens/matches.dart';
import 'package:cricket_app/screens/news.dart';
import 'package:cricket_app/screens/tips.dart';
import 'package:cricket_app/screens/video.dart';
import 'package:flutter/material.dart';

import 'model/post_model.dart';

class MainPage extends StatefulWidget {
  List<Post> current;
  List<Post> news;
  List<Post> tips;

  MainPage(this.news,this.current,this.tips);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      Home(widget.news,widget.current,widget.tips),
      Tips(widget.tips),
      News(widget.news),
      Matches(widget.current),
      VideoPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text("Cricknick",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25.0),),
          alignment: Alignment.center,
        ),
      ),
      body: _children[_currentindex],
      bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: Colors.green),
          child: BottomNavigationBar(
              onTap: onTapChange,
              currentIndex: _currentindex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.lightbulb_outline), title: Text("Tips")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.format_align_justify),
                    title: Text("News")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.desktop_mac), title: Text("Matches")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.play_circle_outline),
                    title: Text("Videos")),
              ])),
    );
  }

  void onTapChange(int index) {
    setState(() {
      _currentindex = index;
    });
  }
}
