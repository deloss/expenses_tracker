import 'package:expenses_tracker/data/model/Transaction.dart';
import 'package:expenses_tracker/ui/components/AddTransactionForm.dart';
import 'package:expenses_tracker/ui/components/TransactionList.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transactions = [
    Transaction(
        expenses: 12.15, name: "First expense", id: "1", date: DateTime.now()),
    Transaction(
        expenses: 12.12, name: "Second expense", id: "2", date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Tracker"),
      ),
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TransactionList(transactions)
        ],
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(padding: EdgeInsets.only(bottom: 16), child: FloatingActionButton(child: Icon(Icons.add), onPressed: () => _showAddTransactionModal(context)
        ,)),
    );
  }

  void _showAddTransactionModal(BuildContext context) {
    showMaterialModalBottomSheet(context: context, builder: (ctx, scrollController) {
      return Wrap(children: [AddTransactionForm(addTransactionCallback: addTransactionCallback)]);
    });
  }

  void addTransactionCallback(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

}