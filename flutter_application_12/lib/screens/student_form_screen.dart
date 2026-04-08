import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentFormScreen extends StatefulWidget {
  const StudentFormScreen({
    super.key,
    this.student,
    required this.existingRollNumbers,
  });

  final Student? student;
  final Set<String> existingRollNumbers;

  bool get isEdit => student != null;

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _SubjectFieldControllers {
  _SubjectFieldControllers({
    String subject = '',
    String marks = '',
  })  : subjectController = TextEditingController(text: subject),
        marksController = TextEditingController(text: marks);

  final TextEditingController subjectController;
  final TextEditingController marksController;

  void dispose() {
    subjectController.dispose();
    marksController.dispose();
  }
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _rollNumberController;
  final List<_SubjectFieldControllers> _subjectRows =
      <_SubjectFieldControllers>[];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student?.name ?? '');
    _rollNumberController = TextEditingController(
      text: widget.student?.rollNumber ?? '',
    );

    if (widget.student != null && widget.student!.subjectScores.isNotEmpty) {
      for (final SubjectScore item in widget.student!.subjectScores) {
        _subjectRows.add(
          _SubjectFieldControllers(
            subject: item.subject,
            marks: item.marks.toString(),
          ),
        );
      }
    } else {
      _subjectRows.add(_SubjectFieldControllers());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rollNumberController.dispose();
    for (final _SubjectFieldControllers row in _subjectRows) {
      row.dispose();
    }
    super.dispose();
  }

  void _addSubjectRow() {
    setState(() {
      _subjectRows.add(_SubjectFieldControllers());
    });
  }

  void _removeSubjectRow(int index) {
    if (_subjectRows.length == 1) {
      return;
    }

    setState(() {
      final _SubjectFieldControllers removed = _subjectRows.removeAt(index);
      removed.dispose();
    });
  }

  void _saveStudent() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final List<SubjectScore> subjectScores = _subjectRows
        .map(
          (_SubjectFieldControllers row) => SubjectScore(
            subject: row.subjectController.text.trim(),
            marks: double.parse(row.marksController.text.trim()),
          ),
        )
        .toList();

    final Student newStudent = Student(
      name: _nameController.text.trim(),
      rollNumber: _rollNumberController.text.trim(),
      subjectScores: subjectScores,
    );

    Navigator.of(context).pop<Student>(newStudent);
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.isEdit ? 'Edit Student' : 'Add Student';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _rollNumberController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Roll Number',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  final String rollNumber = value?.trim() ?? '';
                  if (rollNumber.isEmpty) {
                    return 'Roll number cannot be empty';
                  }

                  final String? currentRoll = widget.student?.rollNumber;
                  final bool isChanged = rollNumber != currentRoll;
                  if (isChanged &&
                      widget.existingRollNumbers.contains(rollNumber)) {
                    return 'Roll number already exists';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Text(
                      'Subjects and Marks',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _addSubjectRow,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Subject'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...List<Widget>.generate(_subjectRows.length, (int index) {
                final _SubjectFieldControllers row = _subjectRows[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: row.subjectController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Subject ${index + 1}',
                            border: const OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          controller: row.marksController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'Marks',
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            final String marks = value?.trim() ?? '';
                            if (marks.isEmpty) {
                              return 'Required';
                            }

                            final double? parsed = double.tryParse(marks);
                            if (parsed == null) {
                              return 'Numeric';
                            }

                            if (parsed < 0 || parsed > 100) {
                              return '0-100';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 6),
                      IconButton(
                        onPressed: _subjectRows.length == 1
                            ? null
                            : () => _removeSubjectRow(index),
                        icon: const Icon(Icons.delete_outline),
                        tooltip: 'Remove Subject',
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: _saveStudent,
                icon: const Icon(Icons.save),
                label: Text(widget.isEdit ? 'Update Student' : 'Add Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
