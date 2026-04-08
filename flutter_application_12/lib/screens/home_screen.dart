import 'package:flutter/material.dart';

import '../models/student.dart';
import '../services/student_service.dart';
import 'student_marksheet_screen.dart';
import 'student_form_screen.dart';

enum SortMode { none, nameAsc, marksDesc }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StudentService _studentService = StudentService();
  final TextEditingController _searchController = TextEditingController();

  List<Student> _students = <Student>[];
  bool _isLoading = true;
  String _searchQuery = '';
  SortMode _sortMode = SortMode.none;

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadStudents() async {
    setState(() {
      _isLoading = true;
    });

    final List<Student> students = await _studentService.getStudents();

    if (!mounted) {
      return;
    }

    setState(() {
      _students = students;
      _isLoading = false;
    });
  }

  Future<void> _openStudentForm({Student? student}) async {
    final Set<String> rollNumbers = _students
        .map((Student item) => item.rollNumber)
        .toSet();

    final Student? result = await Navigator.of(context).push<Student>(
      MaterialPageRoute<Student>(
        builder: (_) => StudentFormScreen(
          student: student,
          existingRollNumbers: rollNumbers,
        ),
      ),
    );

    if (result == null) {
      return;
    }

    if (student == null) {
      await _studentService.addStudent(result);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student added successfully')),
      );
    } else {
      await _studentService.updateStudent(
        originalRollNumber: student.rollNumber,
        updatedStudent: result,
      );
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student updated successfully')),
      );
    }

    await _loadStudents();
  }

  Future<void> _confirmDelete(Student student) async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Student'),
          content: Text(
            'Are you sure you want to delete ${student.name} (${student.rollNumber})?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm != true) {
      return;
    }

    await _studentService.deleteStudent(student.rollNumber);
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Student deleted successfully')),
    );
    await _loadStudents();
  }

  List<Student> get _visibleStudents {
    final String query = _searchQuery.trim().toLowerCase();
    List<Student> filtered = _students.where((Student student) {
      if (query.isEmpty) {
        return true;
      }
      final String subjectsText = student.subjectScores
          .map((SubjectScore item) => item.subject)
          .join(' ')
          .toLowerCase();
      return student.name.toLowerCase().contains(query) ||
          student.rollNumber.toLowerCase().contains(query) ||
          subjectsText.contains(query);
    }).toList();

    if (_sortMode == SortMode.nameAsc) {
      filtered.sort(
        (Student a, Student b) =>
            a.name.toLowerCase().compareTo(b.name.toLowerCase()),
      );
    } else if (_sortMode == SortMode.marksDesc) {
      filtered.sort(
        (Student a, Student b) => b.averageMarks.compareTo(a.averageMarks),
      );
    }

    return filtered;
  }

  double get _averageMarks {
    final int totalSubjects = _students.fold<int>(
      0,
      (int count, Student student) => count + student.subjectScores.length,
    );
    if (totalSubjects == 0) {
      return 0;
    }

    final double total = _students.fold<double>(
      0,
      (double sum, Student student) => sum + student.totalMarks,
    );

    return total / totalSubjects;
  }

  Student? get _topScorer {
    if (_students.isEmpty) {
      return null;
    }

    Student top = _students.first;
    for (final Student student in _students) {
      if (student.averageMarks > top.averageMarks) {
        top = student;
      }
    }
    return top;
  }

  @override
  Widget build(BuildContext context) {
    final List<Student> visibleStudents = _visibleStudents;
    final Student? topScorer = _topScorer;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Record Manager'),
        actions: <Widget>[
          PopupMenuButton<SortMode>(
            initialValue: _sortMode,
            onSelected: (SortMode value) {
              setState(() {
                _sortMode = value;
              });
            },
            itemBuilder: (BuildContext context) => const <PopupMenuEntry<SortMode>>[
              PopupMenuItem<SortMode>(
                value: SortMode.none,
                child: Text('Sort: Default'),
              ),
              PopupMenuItem<SortMode>(
                value: SortMode.nameAsc,
                child: Text('Sort: Name (A-Z)'),
              ),
              PopupMenuItem<SortMode>(
                value: SortMode.marksDesc,
                child: Text('Sort: Marks (High-Low)'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openStudentForm(),
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by name, roll number, or subject',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.analytics_outlined),
                      title: const Text('Average Marks'),
                      subtitle: Text(_averageMarks.toStringAsFixed(2)),
                    ),
                  ),
                ),
                Expanded(
                  child: visibleStudents.isEmpty
                      ? const Center(
                          child: Text('No students found. Tap + to add records.'),
                        )
                      : ListView.builder(
                          itemCount: visibleStudents.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Student student = visibleStudents[index];
                            final bool isTopScorer =
                                topScorer != null &&
                                student.rollNumber == topScorer.rollNumber;

                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              color: isTopScorer
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer
                                  : null,
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => StudentMarksheetScreen(
                                        student: student,
                                      ),
                                    ),
                                  );
                                },
                                leading: CircleAvatar(
                                  child: Text(
                                    student.name.isEmpty
                                        ? '?'
                                        : student.name[0].toUpperCase(),
                                  ),
                                ),
                                title: Row(
                                  children: <Widget>[
                                    Expanded(child: Text(student.name)),
                                    if (isTopScorer)
                                      const Tooltip(
                                        message: 'Top scorer',
                                        child: Icon(Icons.emoji_events_outlined),
                                      ),
                                  ],
                                ),
                                subtitle: Text(
                                  'Roll: ${student.rollNumber} | Average: ${student.averageMarks.toStringAsFixed(2)}\nSubjects: ${student.subjectScores.isEmpty ? 'N/A' : student.subjectScores.map((SubjectScore item) => item.subject).join(', ')}',
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      tooltip: 'Edit',
                                      onPressed: () =>
                                          _openStudentForm(student: student),
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      tooltip: 'Delete',
                                      onPressed: () => _confirmDelete(student),
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
