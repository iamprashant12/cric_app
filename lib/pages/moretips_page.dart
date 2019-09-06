
import 'package:cricket_app/screens/tips.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class MoreNews extends StatelessWidget {
  List<Post> list=[];
  MoreNews(this.list);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Tips(list),
    );
  }
}
