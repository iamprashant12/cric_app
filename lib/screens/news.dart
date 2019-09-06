import 'package:cricket_app/model/post_model.dart';
import 'package:flutter/material.dart';

import '../widgets/customlistcard.dart';

class News extends StatelessWidget {
  List<Post> news;
  News(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemBuilder: (context, index) => new ListCard('images/cric.png',news,index),
        itemCount: news.length,
        shrinkWrap: true,
      ),
    );
  }
}
