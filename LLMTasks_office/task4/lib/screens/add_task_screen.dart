import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
    this.initialTask,
    this.screenTitle = "Add Task",
    this.buttonTitle = "Save Task",
  });

  final String? initialTask;
  final String screenTitle;
  final String buttonTitle;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialTask ?? '';
  }

  void saveTask() {
    final task = controller.text.trim();

    if (task.isEmpty) {
      return;
    }

    Navigator.pop(context, task);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenTitle),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter Task",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveTask,
              child: Text(widget.buttonTitle),
            )
          ],
        ),
      ),
    );
  }
}
