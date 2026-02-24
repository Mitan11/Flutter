import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  final Function addExpense;
  const AddExpenseScreen({super.key, required this.addExpense});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final amountController = TextEditingController();
  final categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void saveExpense() {
    if (_formKey.currentState!.validate()) {
      double value = double.parse(amountController.text);
      String category = categoryController.text;

      // Pass both amount and category to the addExpense function
      widget.addExpense(value, category);

      // Navigate back to HomeScreen after saving the expense
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expense")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text("Enter Amount")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter amount";
                  }
                  if (double.tryParse(value) == null) {
                    return "Enter valid number";
                  }
                  if (double.parse(value) <= 0) {
                    return "Invalid amount";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(label: Text("Enter Category")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter category";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: saveExpense, child: Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}