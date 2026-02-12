import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppScaffold.dart';
import 'package:flutter_application_1/Employees.dart';
import 'package:flutter_application_1/Product.dart';
import 'package:flutter_application_1/Question1.dart';
import 'package:flutter_application_1/Question2.dart';
import 'package:flutter_application_1/Question3.dart';
import 'package:flutter_application_1/Question5.dart';
import 'package:flutter_application_1/Questions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Questions> questions = [
    Questions(question: "Q1", className: Question1()),
    Questions(question: "Q2", className: Question2()),
    Questions(question: "Q3", className: Question3()),
    Questions(question: "Q4", className: Question2()),
    Questions(question: "Q5", className: Question5()),
    Questions(question: "Q6", className: Product()),
    Questions(question: "Q7", className: Employees()),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Index",
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assignment 2",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            ...questions.map(
              (q) => TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => q.className),
                  );
                },
                child: Text(q.question),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
