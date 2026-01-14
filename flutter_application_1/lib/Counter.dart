import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void calculate(operation) {
    
    switch (operation) {
      case '+':
        setState(() {
          _counter++;
        });
        break;
      case '-':
        setState(() {
          _counter--;
        });
        break;
      case 'reset':
        setState(() {
          _counter = 0;
        });
        break;
      case 'sign':
        setState(() {
          _counter = -_counter;
        });
        break;
      default:
        break;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Counter Value: $_counter",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => calculate('+'),
              child: Text('+'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => calculate('-'),
              child: Text('-'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => calculate('reset'),
              child: Text('Reset'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => calculate('sign'),
              child: Text('Sign'),
            ),
          ],
        ),
      ],
    );
  }
}