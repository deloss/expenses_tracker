import 'package:flutter/cupertino.dart';

class Transaction {
  double expenses;
  String name;
  DateTime date;
  String id;

  Transaction({@required this.expenses, @required this.name, @required this.date, @required this.id});
}
