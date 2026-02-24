import 'package:flutter/material.dart';

class StudentDetailsScreen extends StatefulWidget {
  final String name;
  const StudentDetailsScreen({super.key, required this.name});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back to HomeScreen
          },
        ),
      ),
      body: Center(
        child: Text(
          "Student Name is = ${widget.name}",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}