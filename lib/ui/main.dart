import 'package:expenses_tracker/data/model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(HomePage());
}

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App title"),
        ),
        body: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TransactionList(transactions)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(padding: EdgeInsets.only(bottom: 16), child: FloatingActionButton(child: Icon(Icons.add), onPressed: () => showBottomSheet(
            context: context,
            builder: (ctx) => Container(
              color: Colors.grey[900],
              height: 250,
            ))
          ,)),
      ),
    );
  }
  
  void _showAddTransactionModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) {
      return AddTransactionForm(addTransactionCallback: addTransactionCallback);
    });
  }

  void addTransactionCallback(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

}

class AddTransactionForm extends StatelessWidget {

  TextEditingController expensesController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  int idIncrementer = 0;

  Function addTransactionCallback;

  AddTransactionForm({this.addTransactionCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 16, bottom: 32),
        width: double.infinity,
        height: 100,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Enter the name"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: expensesController,
              decoration: InputDecoration(labelText: "Enter the expenses"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: RaisedButton(
              color: Colors.blue,
              child: Container(
                child: Text("Add transaction", style: TextStyle(color: Colors.white),),
              ),
              onPressed: () => {
                if (nameController.text.isNotEmpty && expensesController.text.isNotEmpty) {
                  addTransactionCallback(
                      Transaction(
                          expenses: double.parse(expensesController.text), name: nameController.text, date: DateTime.now(), id: idIncrementer.toString())
                  )
                }
              },
            ),
          ),
        ]));
  }
}

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard(this.transaction);

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

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
              return TransactionCard(transactions[index]);
            },
          itemCount: transactions.length,
        );
  }
}