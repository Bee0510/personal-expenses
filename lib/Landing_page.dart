// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_build_context_synchronously, sized_box_for_whitespace

import 'dart:async';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const LandMe = 'Land';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        height: double.infinity,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 150),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to App',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Let's save some money together"),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(1.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    var sharedpref = await SharedPreferences.getInstance();
                    sharedpref.setBool(MySplashScreenState.Keyword, true);

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Container(
                    width: 310,
                    child: Text('Get Started'),
                  ),
                ),
                IconButton(
                  onPressed: (() async {
                    var sharedpref = await SharedPreferences.getInstance();
                    sharedpref.setBool(MySplashScreenState.Keyword, true);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }),
                  icon: Icon(
                    Icons.arrow_circle_right_rounded,
                  ),
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}