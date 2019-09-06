import 'package:cricket_app/model/video_model.dart';
import 'package:cricket_app/widgets/video_card.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Video> list = [];
    Video vid = Video(
        title: "How Virat Kohli became India's most successful Test captain̥",
        thumbnail: 'images/thumb1.jpg',
        duration: 1,
        updated_on: 1);
    list.add(vid);
    list.add(vid);
    list.add(vid);
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => VideoCard(1),
        itemCount: list.length,
      ),
    );
  }
}
