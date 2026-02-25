
import 'package:flutter/material.dart';
import 'package:task4/screens/add_task_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Map<String, dynamic>> tasks = [];

  String selectedFilter = 'all';

  void addTask(String taskTitle) {
    if (taskTitle.trim().isEmpty) {
      return;
    }

    setState(() {
      tasks.add({"title": taskTitle.trim(), "completed": false});
    });
  }

  void editTask(int index, String updatedTitle) {
    if (updatedTitle.trim().isEmpty) {
      return;
    }

    setState(() {
      tasks[index]['title'] = updatedTitle.trim();
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  List<Map<String, dynamic>> get filteredTasks {
    if (selectedFilter == 'completed') {
      return tasks.where((task) => task['completed'] == true).toList();
    }

    if (selectedFilter == 'pending') {
      return tasks.where((task) => task['completed'] == false).toList();
    }

    return tasks;
  }

  String get filterTitle {
    switch (selectedFilter) {
      case 'completed':
        return 'Completed Tasks';
      case 'pending':
        return 'Pending Tasks';
      default:
        return 'All Tasks';
    }
  }

  Future<void> openEditTask(int index) async {
    final editedTask = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(
          initialTask: tasks[index]['title'],
          screenTitle: 'Edit Task',
          buttonTitle: 'Update Task',
        ),
      ),
    );

    if (editedTask != null) {
      editTask(index, editedTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Manager (${tasks.length})'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedFilter = value;
              });
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'all', child: Text('All Tasks')),
              PopupMenuItem(value: 'completed', child: Text('Completed Tasks')),
              PopupMenuItem(value: 'pending', child: Text('Pending Tasks')),
            ],
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),

      body: filteredTasks.isEmpty
          ? Center(
              child: Text('$filterTitle Not Available'),
            )
          : ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                final originalIndex = tasks.indexOf(task);

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(
                      task['title'],
                      style: TextStyle(
                        decoration: task['completed']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => openEditTask(originalIndex),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => deleteTask(originalIndex),
                          icon: const Icon(Icons.delete),
                        ),
                        Icon(
                          task['completed']
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                        ),
                      ],
                    ),

                    onTap: () => toggleTask(originalIndex),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final messenger = ScaffoldMessenger.of(context);

          final newTask = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );

          if (newTask != null) {
            addTask(newTask);
            messenger.showSnackBar(
              const SnackBar(content: Text('Task added successfully')),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}