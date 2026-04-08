import 'dart:convert';

class SubjectScore {
  const SubjectScore({
    required this.subject,
    required this.marks,
  });

  final String subject;
  final double marks;

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'marks': marks,
    };
  }

  factory SubjectScore.fromMap(Map<String, dynamic> map) {
    return SubjectScore(
      subject: map['subject'] as String? ?? '',
      marks: (map['marks'] as num?)?.toDouble() ?? 0,
    );
  }
}

class Student {
  const Student({
    required this.name,
    required this.rollNumber,
    required this.subjectScores,
  });

  final String name;
  final String rollNumber;
  final List<SubjectScore> subjectScores;

  double get totalMarks => subjectScores.fold<double>(
        0,
        (double sum, SubjectScore item) => sum + item.marks,
      );

  double get averageMarks =>
      subjectScores.isEmpty ? 0 : totalMarks / subjectScores.length;

  Student copyWith({
    String? name,
    String? rollNumber,
    List<SubjectScore>? subjectScores,
  }) {
    return Student(
      name: name ?? this.name,
      rollNumber: rollNumber ?? this.rollNumber,
      subjectScores: subjectScores ?? this.subjectScores,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rollNumber': rollNumber,
      'subjectScores': subjectScores
          .map((SubjectScore item) => item.toMap())
          .toList(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    final dynamic subjectScoresRaw = map['subjectScores'];

    List<SubjectScore> parsedSubjectScores = <SubjectScore>[];
    if (subjectScoresRaw is List) {
      parsedSubjectScores = subjectScoresRaw
          .whereType<Map<String, dynamic>>()
          .map(SubjectScore.fromMap)
          .toList();
    } else {
      // Legacy format fallback:
      // subjects: ['Math', 'Science'], marks: 82
      final dynamic subjectsRaw = map['subjects'];
      final double legacyMarks = (map['marks'] as num?)?.toDouble() ?? 0;

      final List<String> parsedSubjects;
      if (subjectsRaw is List) {
        parsedSubjects = subjectsRaw.map((dynamic e) => e.toString()).toList();
      } else if (subjectsRaw is String) {
        parsedSubjects = subjectsRaw
            .split(',')
            .map((String e) => e.trim())
            .where((String e) => e.isNotEmpty)
            .toList();
      } else {
        parsedSubjects = <String>[];
      }

      if (parsedSubjects.isNotEmpty) {
        parsedSubjectScores = parsedSubjects
            .map(
              (String subject) => SubjectScore(
                subject: subject,
                marks: legacyMarks,
              ),
            )
            .toList();
      } else if (map.containsKey('marks')) {
        parsedSubjectScores = <SubjectScore>[
          SubjectScore(subject: 'General', marks: legacyMarks),
        ];
      }
    }

    return Student(
      name: map['name'] as String? ?? '',
      rollNumber: map['rollNumber'] as String? ?? '',
      subjectScores: parsedSubjectScores,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
