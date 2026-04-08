import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentMarksheetScreen extends StatelessWidget {
  const StudentMarksheetScreen({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Marksheet'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    student.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6),
                  Text('Roll Number: ${student.rollNumber}'),
                  Text('Subjects: ${student.subjectScores.length}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Subject')),
                  DataColumn(label: Text('Marks')),
                ],
                rows: student.subjectScores
                    .map(
                      (SubjectScore item) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(item.subject)),
                          DataCell(Text(item.marks.toStringAsFixed(2))),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.summarize_outlined),
              title: const Text('Total Marks'),
              subtitle: Text(student.totalMarks.toStringAsFixed(2)),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.analytics_outlined),
              title: const Text('Average Marks'),
              subtitle: Text(student.averageMarks.toStringAsFixed(2)),
            ),
          ),
        ],
      ),
    );
  }
}
