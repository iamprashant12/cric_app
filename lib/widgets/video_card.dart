import 'package:cricket_app/model/video_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  double ratio;
  List<Video> list;
  int index;
  VideoCard(this.ratio,this.list,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new InkWell(
        onTap: _launchURL,
        child: new Card(
          child: new Container(
            height: MediaQuery.of(context).size.height * 0.34,
            width: MediaQuery.of(context).size.width * ratio,
            child: new Stack(
              children: <Widget>[
                new Align(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Image.asset(
                          list[index].thumbnail,
                          fit: BoxFit.contain,
                        ),
                        flex: 3,
                      ),
                      Flexible(
                        child: new Container(
                          padding: EdgeInsets.only(top: 7.0,left: 5.0,right: 5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                  list[index].title),
                              new SizedBox(
                                height: 3.0,
                              ),
                              new Text(
                                "1 hour ago",
                                style: TextStyle(color: Colors.grey, fontSize: 13.0),
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                  alignment: Alignment(0.0, 0.0),
                ),
                new Align(
                  child: new Icon(Icons.play_circle_filled,color: Colors.black,size: 50.0,),
                  alignment: Alignment(0.0, 0.0),
                ),
                if(ratio<1)
                  Container()
                else
                  new Align(
                    child:
                    new Container(
                      child: new Text("4:09",style: TextStyle(color: Colors.white),),
                      color: Colors.black,
                      padding: EdgeInsets.only(left: 3.0,right: 3.0,top: 1.0,bottom: 2.0),
                    ),
                    alignment: Alignment(0.85, 0.50),
                  )
              ],
            ),
          ),
        )
        ,
      ),
    );
  }

  void _launchURL() async
  {
    String url=list[index].url;
    if(await canLaunch(url))
      await launch(url);
    else
      print("Can't launch");
  }
}
