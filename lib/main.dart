// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, use_key_in_widget_constructors, non_constant_identifier_names, unused_import, duplicate_import
import 'package:flutter_application_1/Landing_page.dart';
import 'package:flutter_application_1/calculator.dart';
import 'package:flutter_application_1/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart ';
import './widgets/chart.dart';
import 'Landing_page.dart';
import 'widgets/login_screen.dart';
import 'splash_screen.dart';
import 'calculator.dart';
import './widgets/About_Us.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'OpenSans',
        errorColor: Colors.red,
      ),
      home: MySplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _usertransaction = [
    // Transaction(
    //   ID: 'V1',
    //   Title: 'Jacket',
    //   value: 234.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   ID: 'V2',
    //   Title: 'Restro',
    //   value: 543.49,
    //   date: DateTime.now(),
    // )
  ];

  List<Transaction> get _recentTransaction {
    return _usertransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String Txtitle, double Txamount, DateTime ChosenDate) {
    final newTx = Transaction(
      ID: DateTime.now().toString(),
      Title: Txtitle,
      value: Txamount,
      date: ChosenDate,
    );
    setState(() {
      _usertransaction.add(newTx);
    });
  }

  void StartAddNewTransaction(BuildContext Cxt) {
    showModalBottomSheet(
        context: Cxt,
        builder: (BCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.translucent,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _usertransaction.removeWhere((tx) {
        return tx.ID == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: IconButton(
                icon: Icon(Icons.person_outline_sharp),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              radius: 18,
            );
          }),
          title: Text(
            'Personal Expenses',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.calculate_outlined),
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Calculator())));
              }),
            ),
            IconButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => AboutUs())));
                }),
                icon: Icon(Icons.info_outline_rounded))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Card(
                    color: Colors.transparent,
                    child: Text(
                      'Weekly Expenses Report',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Chart(_recentTransaction),
              TransactionList(_usertransaction, _deleteTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => StartAddNewTransaction(context),
        ),
      ),
    );
  }
}
