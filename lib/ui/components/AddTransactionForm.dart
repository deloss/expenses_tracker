import 'package:expenses_tracker/data/model/Transaction.dart';
import 'package:flutter/material.dart';

class AddTransactionForm extends StatefulWidget {

  Function addTransactionCallback;

  AddTransactionForm({this.addTransactionCallback});

  @override
  State<StatefulWidget> createState() {
    return _AddTransactionFormState();
  }

}

class _AddTransactionFormState extends State<AddTransactionForm> {

  TextEditingController expensesController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  int idIncrementer = 0;

  _AddTransactionFormState();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 16, bottom: 32),
        width: double.infinity,
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
                  widget.addTransactionCallback(
                      Transaction(
                          expenses: double.parse(expensesController.text), name: nameController.text, date: DateTime.now(), id: idIncrementer.toString())
                  ),
                  Navigator.of(context).pop()
                }
              },
            ),
          ),
        ]));
  }

}