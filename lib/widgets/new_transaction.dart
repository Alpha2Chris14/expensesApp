import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);
  void submitData() {
    // print(titleController.text);
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    // print(titleInput);
    // print(amountInput);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            // onChanged: (val) {
            //   titleInput = val;
            // },
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            keyboardType: TextInputType.number,
            // onChanged: (value) => amountInput = value,
            controller: amountController,
            onSubmitted: (_) => submitData(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: submitData,
            child: Text("Add Transaction"),
          )
        ]),
      ),
    );
  }
}
