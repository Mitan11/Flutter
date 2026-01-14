import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stwidget extends StatefulWidget {
  const Stwidget({super.key});

  @override
  State<Stwidget> createState() => _StwidgetState();
}

class _StwidgetState extends State<Stwidget> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      setState(() {
        name = "Welcome to Myapp";
      });
    }, child: Text("${name ?? 'Click Me'}"));
  }
}