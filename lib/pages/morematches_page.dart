import 'package:cricket_app/model/post_model.dart';
import 'package:cricket_app/screens/matches.dart';
import 'package:flutter/material.dart';

class MoreMatches extends StatelessWidget {
  List<Post> current;
  MoreMatches(this.current);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Matches(current),
    );
  }
}
