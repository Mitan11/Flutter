import 'package:flutter/material.dart';

class StudentDetailsScreen extends StatelessWidget {
  final String studentName;

  const StudentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Details")),
      body: Center(
        child: Text("Student Name is = $studentName",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}