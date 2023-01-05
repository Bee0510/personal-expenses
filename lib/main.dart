// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, use_key_in_widget_constructors, non_constant_identifier_names, unused_import, duplicate_import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart ';
import './widgets/chart.dart';

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
        errorColor: Color.fromARGB(255, 246, 196, 192),
      ),
      home: MyHomePage(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => StartAddNewTransaction(context),
          ),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(child: Text('First')),
              const PopupMenuItem(child: Text('Second')),
            ];
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
    );
  }
}
