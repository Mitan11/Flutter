/**Create a Dart program to implement a To-Do List application using
a List.
The program should support the following operations:
● Add new tasks
● Remove existing tasks
● Mark tasks as completed
● Display pending tasks and completed tasks separately */

import 'dart:io';

void main() {
  // Create a To-Do List
  List<String> todos = [];
  List<String> completedTodos = [];

  // Choices to be implemented
  // 1. Add new tasks
  // 2. Remove existing tasks
  // 3. Mark tasks as completed
  // 4. Display pending tasks and completed tasks separately

  while (true) {
    print("\nTo-Do List Application");

    print("1. Add new tasks");
    print("2. Remove existing tasks");
    print("3. Mark tasks as completed");
    print("4. Display pending tasks and completed tasks separately");
    print("5. Exit");

    print("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        String task;
        print("Enter the task to add: ");
        task = stdin.readLineSync()!;
        if (task.isEmpty) {
          print("Task cannot be empty");
        } else {
          todos.add(task);
        }
        break;
      case 2:
        print("Enter the task number to remove from pending tasks: ");
        int taskNum = int.parse(stdin.readLineSync()!);
        if (taskNum < 1 || taskNum > todos.length) {
          print("Invalid task number");
        } else {
          todos.removeAt(taskNum - 1);
        }
        break;

      case 3:
        print("Enter the task number to mark as completed: ");
        int taskNum = int.parse(stdin.readLineSync()!);
        if (taskNum < 1 || taskNum > todos.length) {
          print("Invalid task number");
        } else {
          String completedTask = todos.removeAt(taskNum - 1);
          completedTodos.add(completedTask);
        }
        break;

      case 4:
        print("\nPending Tasks:");
        if (todos.isEmpty) {
          print("No pending tasks");
        } else {
          for (var i = 0; i < todos.length; i++) {
            print("${i + 1}. ${todos[i]}");
          }
        }
        print("\nCompleted Tasks:");
        if (completedTodos.isEmpty) {
          print("No completed tasks");
        } else {
          for (var i = 0; i < completedTodos.length; i++) {
            print("${i + 1}. ${completedTodos[i]}");
          }
        }
        break;
      case 5:
        exit(0);
      default:
        print("Invalid choice");
    }
  }
}
