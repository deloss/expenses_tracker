

import 'package:expenses_tracker/data/model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        if (transactions.isEmpty) {
          return Image.asset("assets/images/img_waiting.png");
        } else {
          return _TransactionCard(transactions[index]);
        }
      },
      itemCount: transactions.length,
    );
  }
}

class _TransactionCard extends StatelessWidget {
  final Transaction transaction;

  _TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        width: double.infinity,
        child: Card(
            elevation: 2,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Text("\$${transaction.expenses.toString()}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
                  Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.name,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(
                                  DateFormat("yyyy-MM-dd HH:mm:ss")
                                      .format(transaction.date),
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 14))
                          )
                        ],
                      ))
                ]))));
  }
}