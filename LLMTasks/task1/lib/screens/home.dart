import 'package:flutter/material.dart';
import 'package:task1/screens/add_expense.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> expenses = [
    {'amount': 767, 'category': 'Food'},
    {'amount': 9, 'category': 'Transport'},
    {'amount': 23, 'category': 'Utilities'}
  ];
  double total = 0;

  @override
  void initState() {
    super.initState();
    total = expenses.fold(0.0, (sum, item) => sum + item['amount']);
  }

  void addExpense(double value, String category) {
    setState(() {
      expenses.add({'amount': value, 'category': category});
      total = expenses.fold(0.0, (sum, item) => sum + item['amount']);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Expense Added! ₹$value in $category category.')),
    );
  }

  void deleteExpense(int index) {
    setState(() {
      total -= expenses[index]['amount'];
      expenses.removeAt(index);
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
              Text("Total Expenses: ₹$total", style: TextStyle(fontSize: 24)),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddExpenseScreen(addExpense: addExpense),
                    ),
                  );
                },
                label: Text("Add Expense"),
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Expanded(
            child: expenses.isEmpty
                ? Center(child: Text("No expenses added."))
                : ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text("₹${expenses[index]['amount']} - ${expenses[index]['category']}"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => deleteExpense(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}