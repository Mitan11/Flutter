import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  final Function addStudent;
  const AddStudentScreen({super.key, required this.addStudent});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final controller = TextEditingController();

  void save() {
    if (controller.text.isNotEmpty) {
      widget.addStudent(controller.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                label: Text("Name"),
                hintText: "Enter Student Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: save, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}