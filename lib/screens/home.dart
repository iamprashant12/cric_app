import 'dart:math' as prefix0;

import 'package:cricket_app/model/video_model.dart';
import 'package:cricket_app/pages/morematches_page.dart';
import 'package:cricket_app/widgets/cricketnews_carousel.dart';
import 'package:cricket_app/widgets/customlistcard.dart';
import 'package:cricket_app/pages/moretips_page.dart';
import 'package:cricket_app/repository/post_repository.dart';
import 'package:cricket_app/widgets/scorecard.dart';
import 'package:cricket_app/widgets/video_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class Home extends StatefulWidget {
  List<Post> news = [];
  List<Post> current = [];
  List<Post> tips = [];

  Home(this.news, this.current, this.tips);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    int minTips = prefix0.min(
        widget.tips.length, 6); //for showing atmost 6 tips element in home page

    return new Container(
        child: new Flex(
      direction: Axis.vertical,
      children: <Widget>[
        new Expanded(
          child: new Column(
            children: <Widget>[
              Expanded(
                  child: new ListView.builder(
                itemBuilder: (context, index) => (index ==
                        0 //checking for zero for inserting the horizontal list(i.e Current Matches) into vertical view
                    ? showCurrentMatch(widget.current, widget.news, width)
                    : index ==
                            minTips +
                                1 //checking for last index address to insert view more news portion in List
                        ? additionalTips(width, widget.tips)
                        : new ListCard(
                            'images/ball.png', widget.tips, index - 1)),
                itemCount: minTips + 2,
                //increased count by 2 as we have inserted two extra elements(i.e horizontal list and view more tips) in list
                shrinkWrap: true,
              )),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        )
      ],
    ));
  }

  Widget showCurrentMatch(List<Post> current, List<Post> news, double width) {
    //Shows whole portion including the current matches and Carousel news section
    int minMatches = prefix0.min(news.length, 4);
    List<Video> list = [];
    Video vid = Video(
        title: "How Virat Kohli became India's most successful Test captain̥",
        thumbnail: 'images/thumb1.jpg',
        duration: 1,
        updated_on: 1,
        url: "https://www.youtube.com/watch?v=TwqmIqgiOy0");
    list.add(vid);
    vid=Video(
        title: "Steve Smith Strikes Stunning 211 | The Ashes Day 2 Highlights ",
        thumbnail: "images/thumb2.jpg",
        duration: 1,
        updated_on: 1,
        url: "https://www.youtube.com/watch?v=DUxbfz3daXQ&t=90s"
    );
    list.add(vid);
    vid=Video(
        title: "Jasprit Bumrah - The Inspiration Is At Home | ICC Cricket World Cup",
        thumbnail: "images/thumb3.jpg",
        duration: 1,
        updated_on: 1,
        url: "https://www.youtube.com/watch?v=xibXVGaKNBE"
    );
    list.add(vid);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          child: new ListView.builder(
            itemBuilder: (context, index) => index == minMatches
                ? additionalMatches()
                : ScoreCard(current, index, 0.77),
            //checking for last index value to insert view more match element in Horizontal view list
            scrollDirection: Axis.horizontal,
            itemCount: minMatches + 1,
            //shrinkWrap: true,
          ),
          height: 125.0,
        ),
        new SizedBox(
          height: 6.0,
        ),
        CricketNews(news),
        SizedBox(
          height: 10.0,
        ),
        new Text("Featured Videos",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),),
        SizedBox(
          height: 10.0,
        ),
        VideoList(list),
        Text(
          "Fantasy Cricket Tips + Match Info",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.0,
        )
      ],
    );
  }

  Widget additionalTips(double width, List<Post> list) {
    //more tips button
    return new InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MoreNews(list))),
      child: new Container(
          height: 150,
          width: width,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.add_circle_outline,
                size: 40.0,
                color: Colors.black,
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Text("View More Tips")
            ],
          )),
    );
  }

  Widget additionalMatches() {
    //more matches card
    double width = MediaQuery.of(context).size.width;
    return new InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MoreMatches(widget.current))),
      child: new Card(
        elevation: 8.0,
        margin: EdgeInsets.all(5.0),
        child: Container(
          constraints: new BoxConstraints(
            minWidth: width * 0.75,
          ),
          child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(
                  Icons.add_circle_outline,
                  size: 40.0,
                  color: Colors.black,
                ),
                new SizedBox(
                  height: 10.0,
                ),
                new Text(
                  "View More Matches̥",
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget VideoList(List<Video> list) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => VideoCard(0.70,list,index),
        itemCount: list.length,
      ),
      height: MediaQuery.of(context).size.height*0.32,
    );
  }
}
