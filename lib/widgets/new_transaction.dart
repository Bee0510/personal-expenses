// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_element, prefer_const_constructors_in_immutables, avoid_print, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTx;

  NewTransaction(this._addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();
  final valuecontroller = TextEditingController();
  DateTime SelectedDate;

  void submitdata() {
    if (valuecontroller == null) {
      return;
    }
    final enteredTitle = titlecontroller.text;
    final enteredValue = double.parse(valuecontroller.text);
    print(enteredValue);

    if (enteredTitle.isEmpty || enteredValue <= 0) {
      return;
    }
    widget._addTx(
      titlecontroller.text,
      double.parse(valuecontroller.text),
      SelectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDataPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime.now())
        .then((PickedDate) {
      if (PickedDate == null) {
        return;
      }
      setState(() {
        SelectedDate = PickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(label: Text('Title')),
              controller: titlecontroller,
              onSubmitted: (val) => submitdata(),
            ),
            TextField(
              decoration: InputDecoration(label: Text('Value')),
              controller: valuecontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (val) => submitdata(),
            ),
            Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      SelectedDate == null
                          ? 'No date chosen!'
                          : 'Picked Date:${DateFormat.yMd().format(SelectedDate)}',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDataPicker,
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitdata,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
