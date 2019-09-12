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
        updated_on: 1,
        url: "//www.youtube.com/watch?v=TwqmIqgiOy0");
    list.add(vid);
    vid=Video(
        title: "Steve Smith Strikes Stunning 211 | The Ashes Day 2 Highlights ",
        thumbnail: "images/thumb2.jpg",
        duration: 1,
        updated_on: 1,
        url: "//www.youtube.com/watch?v=DUxbfz3daXQ&t=90s"
    );
    list.add(vid);
    vid=Video(
        title: "Jasprit Bumrah - The Inspiration Is At Home | ICC Cricket World Cup",
        thumbnail: "images/thumb3.jpg",
        duration: 1,
        updated_on: 1,
        url: "//www.youtube.com/watch?v=xibXVGaKNBE"
    );
    list.add(vid);
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => VideoCard(1,list,index),
        itemCount: list.length,
      ),
    );
  }
}
