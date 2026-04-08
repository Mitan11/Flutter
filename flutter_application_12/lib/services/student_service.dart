import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/student.dart';

class StudentService {
  static const String _storageKey = 'students_json';

  Future<List<Student>> getStudents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? studentsJson = prefs.getString(_storageKey);

    if (studentsJson == null || studentsJson.isEmpty) {
      return <Student>[];
    }

    final List<dynamic> decoded = jsonDecode(studentsJson) as List<dynamic>;
    return decoded
        .map((dynamic item) => Student.fromMap(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveStudents(List<Student> students) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(
      students.map((Student student) => student.toMap()).toList(),
    );
    await prefs.setString(_storageKey, encoded);
  }

  Future<void> addStudent(Student student) async {
    final List<Student> students = await getStudents();
    students.add(student);
    await saveStudents(students);
  }

  Future<void> updateStudent({
    required String originalRollNumber,
    required Student updatedStudent,
  }) async {
    final List<Student> students = await getStudents();
    final int index = students.indexWhere(
      (Student student) => student.rollNumber == originalRollNumber,
    );

    if (index == -1) {
      return;
    }

    students[index] = updatedStudent;
    await saveStudents(students);
  }

  Future<void> deleteStudent(String rollNumber) async {
    final List<Student> students = await getStudents();
    students.removeWhere((Student student) => student.rollNumber == rollNumber);
    await saveStudents(students);
  }
}
