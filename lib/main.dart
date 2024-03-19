import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:project2/screens/intro_screen.dart';
import 'package:project2/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'KK-Fashions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
      ),
      home: IntroScreen(),
    );
  }
}
