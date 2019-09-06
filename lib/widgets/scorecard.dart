import 'package:cricket_app/pages/description_page.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class ScoreCard extends StatelessWidget {
  final List<Post> list;
  final int index;
  double ratio;

  ScoreCard(this.list,this.index,this.ratio);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(list,index))),
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.all(5.0),
        child: Container(
          constraints: new BoxConstraints(
            minWidth: width * ratio,
          ),
          padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Text 1",
                style: TextStyle(fontSize: 12.4, color: Colors.black54),
              ),
              SizedBox(
                height: 17.0,
              ),
              new Row(
                children: <Widget>[
                  Flexible(
                    child: new Text(
                      "T1",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    flex: 1,
                  ),
                  new SizedBox(
                    width: 60.0,
                  ),
                  Flexible(
                    child: new Column(
                      children: <Widget>[
                        Text(
                          "Text 2",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          "Text 3",
                          style:
                          TextStyle(fontSize: 12.0, color: Colors.blueAccent),
                        )
                      ],
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    flex: 3,
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Flexible(
                    child: new Text(
                      "T2",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    flex: 1,
                  )
                ],
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(
                height: 17.0,
              ),
              Text(
                "Text 4",
                style: TextStyle(fontSize: 13.0, color: Colors.black54),
              )
            ],
          ),
        ),
      ),
    );
  }
}
