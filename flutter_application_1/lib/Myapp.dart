import 'package:flutter/material.dart';
import 'package:flutter_application_1/Counter.dart';
import 'package:flutter_application_1/Stwidget.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Text(
              "Hello World",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                backgroundColor: Colors.purple,
              ),
            ),
            Stwidget() , Counter()
          ],
        ),
      ),
    );
  }
}
