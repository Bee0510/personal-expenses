// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, use_build_context_synchronously, unused_import, use_key_in_widget_constructors

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Landing_page.dart';
import '../login.dart';
import '../splash_screen.dart';
import 'Login Bg.dart';
import 'package:animate_gradient/animate_gradient.dart';

class MyLoginScreen extends StatefulWidget {
  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  final NAME = TextEditingController();
  final PASSWORD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          body: Center(
            child: Container(
              width: 300,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.emoji_people_rounded,
                    size: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: NAME,
                    decoration: InputDecoration(
                      labelText: 'Phone No/Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: PASSWORD,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setBool(MySplashScreenState.KEYWORD, true);

                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LandingPage()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      CircleAvatar(
                        child: Icon(Icons.arrow_forward),
                        backgroundColor: Colors.blueAccent,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: (() {}),
                    child: Center(child: Text('Register?')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
