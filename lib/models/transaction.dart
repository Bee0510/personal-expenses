// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Transaction {
  final String ID;
  final String Title;
  final double value;
  final DateTime date;

  Transaction({
    @required this.ID,
    @required this.Title,
    @required this.value,
    @required this.date,
  });

  num get amount => value;
}
