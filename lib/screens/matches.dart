import 'package:cricket_app/model/post_model.dart';
import 'package:flutter/material.dart';

import '../widgets/scorecard.dart';

class Matches extends StatelessWidget {
  List<Post> current=[];
  Matches(this.current);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemBuilder: (context, index) =>ScoreCard(current,index,1),
        scrollDirection: Axis.vertical,
        itemCount: current.length,
        //shrinkWrap: true,
      ),
    );
  }
}
