import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Counter Widget",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        ElevatedButton(
          onPressed: () {
            increment();
          },
          child: Text("count ++"),
        ),
        ElevatedButton(
          onPressed: () {
            decrement();
          },
          child: Text("count --"),
        ),
        Text(
          "Count Value: $count",
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
