import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppScaffold.dart';
import 'package:flutter_application_1/Login.dart';

class Question2 extends StatefulWidget {
  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: "Question 2", child: Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        alignment: Alignment.center,
        child: Login(),
      ),
    ));
  }
}
