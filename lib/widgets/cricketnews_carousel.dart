import 'package:cricket_app/screens/news.dart';
import 'package:cricket_app/widgets/customlistcard.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../model/post_model.dart';

class CricketNews extends StatefulWidget {
  List<Post> list=[];
  CricketNews(this.list);
  @override
  _CricketNewsState createState() => _CricketNewsState();
}

class _CricketNewsState extends State<CricketNews> {
  @override
  Widget build(BuildContext context) {
    int _current = 0;

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Cricket News",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
          ),
          new SizedBox(
            height: 5.0,
          ),
          Stack(
            children: <Widget>[
              new CarouselSlider(
                height: 80.0,
                autoPlay: false,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: [0, 1].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return i == 0
                          ? advertisment()
                          : InkWell(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Scaffold(
                          appBar: AppBar(),
                          body: News(widget.list),
                        ))),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(color: Colors.white),
                            child: new Center(
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                  new SizedBox(
                                    height: 10.0,
                                  ),
                                  new Text("View More News̥")
                                ],
                              ),
                            )),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          )
        ],
      ),
    );
  }


  Widget advertisment()
  {
    return InkWell(
      //onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(list,index))),
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80.0,
          margin: EdgeInsets.all(3.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                child: new Image.asset(
                  'images/cric.png',
                  fit: BoxFit.fill,
                ),
                flex: 1,
              ),
              SizedBox(
                width: 12.0,
              ),
              Flexible(
                  flex: 4,
                  child: new Text("Follow us on our instagram and twitter handle",
                    style: new TextStyle(
                      fontSize: 15.0,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
