import 'package:flutter/material.dart';
import 'package:flutter_application_7/AppScaffold.dart';
import 'package:flutter_application_7/TodoList.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Tasks> tasks = [Tasks(task: "Task1")];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Todo List",
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].task),
            leading: Checkbox(
              value: tasks[index].isDone,
              onChanged: (value) {
                setState(() {
                  tasks[index].isDone = !tasks[index].isDone;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
