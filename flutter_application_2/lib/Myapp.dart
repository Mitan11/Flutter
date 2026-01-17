import 'package:flutter/material.dart';
import 'package:flutter_application_2/Counter.dart';
import 'package:flutter_application_2/ImageWid.dart';
import 'package:flutter_application_2/StateFull.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Home"), backgroundColor: Colors.amber),
        body: Column(
          children: [
            Center(
              child: Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            StateFull(),
            Counter(),
            ImageWid(),
          ],
        ),
      ),
    );
  }
}
