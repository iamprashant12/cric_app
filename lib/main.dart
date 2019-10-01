
import 'package:cricket_app/mainpage.dart';
import 'package:cricket_app/splashScreen.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      title: "Cricket App",
      home: SplashScreen(),
    );
  }

}
