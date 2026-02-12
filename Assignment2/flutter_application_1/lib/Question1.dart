import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppScaffold.dart';
import 'package:flutter_application_1/Todos.dart';

class Question1 extends StatefulWidget {
  const Question1({super.key});

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  final TextEditingController _task = TextEditingController();
  List<Todos> todoList = [];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "My Todo App",
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Todo App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _task,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your todo',
                      hintText: 'e.g. Buy groceries',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_task.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a task')),
                      );
                      return;
                    }
                    setState(() {
                      todoList.add(Todos(task: _task.text));
                      _task.clear();
                    });
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          todoList[index].task,
                          style: TextStyle(
                            decoration: todoList[index].isComplete
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: todoList[index].isComplete
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        
                        leading: Checkbox(
                          value: todoList[index].isComplete,
                          onChanged: (value) {
                            setState(() {
                              todoList[index].isComplete =
                                  !todoList[index].isComplete;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
