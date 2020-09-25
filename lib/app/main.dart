import 'package:expenses_tracker/ui/screens/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExpensesTrackerApp());
}

class ExpensesTrackerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses Tracker",
      home: HomePage(),
    );
  }

}



