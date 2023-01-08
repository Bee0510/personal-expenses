// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:async';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Landing_page.dart';
import 'login.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => MySplashScreenState();
}

class MySplashScreenState extends State<MySplashScreen> {
  static const KEYWORD = 'LogOff';
  static const Keyword = 'LogInto';

  @override
  void initState() {
    super.initState();
    WhereToGo();
    LetItOver();

    Timer(Duration(seconds: 3), (() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => LogIntoApp())));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.lightBlue,
          child: Center(
            child: CircleAvatar(
              foregroundImage: AssetImage('Images/App-Logo.png'),
              radius: 90,
            ),
          ),
        ),
      ),
    );
  }

  void WhereToGo() async {
    var prefs = await SharedPreferences.getInstance();
    var IsLoggedIn = prefs.getBool(KEYWORD);

    Timer(Duration(seconds: 3), (() {
      if (IsLoggedIn != null) {
        if (IsLoggedIn) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => LandingPage())));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: ((context) => LogIntoApp())));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => LogIntoApp())));
      }
    }));
  }

  void LetItOver() async {
    var sharedprefs = await SharedPreferences.getInstance();
    var IsLoggedInto = sharedprefs.getBool(Keyword);

    Timer(Duration(seconds: 2), (() {
      if (IsLoggedInto != null) {
        if (IsLoggedInto) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: ((context) => MyHomePage())));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: ((context) => LogIntoApp())));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => LogIntoApp())));
      }
    }));
  }
}
