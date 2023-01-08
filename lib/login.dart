// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'widgets/login_screen.dart';

void main() {
  return runApp(LogIntoApp());
}

class LogIntoApp extends StatefulWidget {
  const LogIntoApp({Key key}) : super(key: key);

  @override
  State<LogIntoApp> createState() => _LogIntoAppState();
}

class _LogIntoAppState extends State<LogIntoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLoginScreen(),
    );
  }
}
