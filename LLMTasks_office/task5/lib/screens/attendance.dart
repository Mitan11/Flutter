import 'package:flutter/material.dart';
import 'package:task5/screens/add_student_screen.dart';
import 'package:task5/screens/summary_screen.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List<String> students = [];
  Map<String, bool> attendance = {};

  int get presentCount =>
      attendance.values.where((value) => value == true).length;

  void addStudent(String name) {
    if (name.trim().isEmpty) return;

    setState(() {
      students.add(name);
      attendance[name] = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$name added successfully")),
    );
  }

  void toggleAttendance(String name) {
    setState(() {
      attendance[name] = !(attendance[name] ?? false);
    });
  }

  void deleteStudent(String name) {
    setState(() {
      students.remove(name);
      attendance.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    int absentCount = students.length - presentCount;

    return Scaffold(
      appBar: AppBar(
        title: Text("Students (${students.length})"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SummaryScreen(
                    presentCount: presentCount,
                    totalStudents: students.length,
                  ),
                ),
              );
            },
          )
        ],
      ),

      body: Column(
        children: [
          Text("Present: $presentCount"),
          Text("Absent: $absentCount"),

          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                String name = students[index];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(name),

                    leading: Checkbox(
                      value: attendance[name] ?? false,
                      onChanged: (_) {
                        toggleAttendance(name);
                      },
                    ),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        deleteStudent(name);
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () async {
              final newStudent = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddStudentScreen(),
                ),
              );

              if (newStudent != null && newStudent is String) {
                addStudent(newStudent);
              }
            },
            child: const Text("Add Student"),
          )
        ],
      ),
    );
  }
}