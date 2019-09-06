
import 'package:cricket_app/mainpage.dart';
import 'package:cricket_app/splashscreen.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      title: "Cricket App",
      home: SplashScreen(),
    );
  }

}
