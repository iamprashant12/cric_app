import 'dart:async';

import 'package:cricket_app/screens/home.dart';
import 'package:cricket_app/mainpage.dart';
import 'package:cricket_app/repository/post_repository.dart';
import 'package:flutter/material.dart';

import 'model/post_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Post> news = [];
  List<Post> current = [];
  List<Post> tips = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenForPost();
  }

  void listenForPost() async {
    final Stream<Post> stream = await getPosts();
    stream.listen((Post post) {
      setState(() {
        if(post.postType.compareTo("news")==0)
          news.add(post);
        if(post.postType.compareTo("tips")==0)
          tips.add(post);
        if(post.postType.compareTo("current")==0)
          current.add(post);
      });
    },
    );
    final wait= await Timer(Duration(seconds: 1),()=>Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>MainPage(news,current,tips),)));
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image.asset('images/SplashScreen.jpeg',fit: BoxFit.fill,),
            new Align(
              alignment: Alignment.center,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text("Real Time Cricket News",style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white
                  ),),
                  new Text("Fantasy Cricket Predictor",style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white
                  ),),
                  new Text("&",style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white
                  ),),
                  new Text("Fantasy Cricket Tips",style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white
                  ),),
                  new Text("Pitch Report",style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}