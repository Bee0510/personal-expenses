// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      )),
      child: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text(
                'STRAWHATS',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('Images/Vishal.png'),
              radius: 60,
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.transparent,
              elevation: 6,
              child: Container(
                padding: EdgeInsets.all(3),
                color: Colors.transparent,
                width: 300,
                child: Text(
                  'Vishal Behera, a 20-year-old sophomore at the National Institute of Technology Rourkela, studying Mechanical Engineering has developed the app. He really wanted to develop an app that could solve a real-world issue and so has developed the cash transaction monitoring app.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('Images/Animesh.jpeg'),
              radius: 60,
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.transparent,
              elevation: 6,
              child: Container(
                padding: EdgeInsets.all(3),
                color: Colors.transparent,
                width: 300,
                child: Text(
                  'Animesh Panda, a 19-year-old sophomore at the National Institute of Technology Rourkela, studying Computer Science Engineering has co-developed the app. He wanted to develop an app that solves issues in general faced by people and has come up with the idea of the Cash Transaction monitoring App.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
