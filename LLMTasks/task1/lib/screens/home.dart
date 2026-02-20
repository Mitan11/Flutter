import 'package:flutter/material.dart';
import 'package:task1/screens/add_expense.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    List<double> expenses = [767,9,23];
  double total = 0;

  void addExpense(double value) {
    setState(() {
      expenses.add(value);
      total = expenses.reduce((a, b) => a + b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Manager")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          Text(
            "Total Expenses: ₹$total",
            style: TextStyle(fontSize: 24),
          ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddExpenseScreen(addExpense),
                    ),
                  );
                },
                label: Text("Add Expense"), icon: Icon(Icons.add),
              ),
 ], ),

          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("₹${expenses[index]}"),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}