import 'package:cricket_app/model/post_model.dart';
import 'package:flutter/material.dart';

import '../widgets/customlistcard.dart';

class Tips extends StatelessWidget {
  List<Post> tips;
  Tips(this.tips);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemBuilder: (context, index) => new ListCard('images/ball.png',tips,index),
        itemCount: tips.length,
        shrinkWrap: true,
      ),
    );
  }
}
