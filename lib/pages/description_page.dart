import 'package:flutter/material.dart';

import '../model/post_model.dart';

class Description extends StatefulWidget {
  List<Post> list;
  int index;
  Description(this.list,this.index);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {


    List<Widget> children = [
      Center(
        child: Text(widget.list[widget.index].english),
      ),
      Center(
        child: Text(widget.list[widget.index].hindi),
      )
    ];

    return Scaffold(
      body: children[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTapSelect,
          currentIndex: _currentindex,
          items: [
        new BottomNavigationBarItem(
            icon: Icon(Icons.format_size), title: new Text("English")),
        new BottomNavigationBarItem(
            icon: Icon(Icons.g_translate), title: Text("Hindi"))
      ]),
    );
  }

  void onTapSelect(int index) {
    setState(() {
      _currentindex = index;
    });
  }
}
