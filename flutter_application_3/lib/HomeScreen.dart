import 'package:flutter/material.dart';
import 'package:flutter_application_3/Mainwidget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "data",
            style: TextStyle(
              color: Colors.amber,
              fontFamily: 'PlaywriteGBJGuides',
              fontStyle: FontStyle.italic,
              fontSize: 30,
            ),
          ),
        ),
        body: Column(children: [
          Text("data"),
          Mainwidget()
          ]),
      ),
    );
  }
}
