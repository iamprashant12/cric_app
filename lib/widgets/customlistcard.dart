import 'package:cricket_app/pages/description_page.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class ListCard extends StatelessWidget {
  final String img;
  int index;
  List<Post> list=[];

  ListCard(this.img, this.list,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(list,index))),
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
                  img,
                  fit: BoxFit.fill,
                ),
                flex: 1,
              ),
              SizedBox(
                width: 12.0,
              ),
              Flexible(
                  flex: 4,
                  child: new Text(list[index].title,
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
