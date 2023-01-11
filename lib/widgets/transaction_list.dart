// ignore_for_file: unused_field, prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> Transactions;
  final Function Deleteitem;
  TransactionList(this.Transactions, this.Deleteitem);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        child: Transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text('No Transaction Yet',
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 650,
                    child: Image.asset(
                      'Images/market.png',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(51, 51, 255, 30),
                        radius: 26,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '₹${Transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        Transactions[index].Title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(Transactions[index].date),
                      ),
                      trailing: MediaQuery.of(context).size.width > 500
                          ? Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Theme.of(context).errorColor,
                                  onPressed: () => Deleteitem(
                                    Transactions[index].ID,
                                  ),
                                ),
                                TextButton(
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () =>
                                      Deleteitem(Transactions[index].ID),
                                ),
                              ],
                            )
                          : IconButton(
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                              onPressed: () => Deleteitem(
                                Transactions[index].ID,
                              ),
                            ),
                    ),
                  );
                },
                itemCount: Transactions.length,
              ));
  }
}
