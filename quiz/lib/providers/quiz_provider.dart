import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question.dart';

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  String _currentCategory = '';

  List<Question> get questions => _questions;
  int get currentIndex => _currentIndex;
  int get score => _score;
  int get totalQuestions => _questions.length;
  String get currentCategory => _currentCategory;

  bool get isFinished => _currentIndex >= _questions.length;

  Question get currentQuestion => _questions[_currentIndex];

  void loadQuestions(List<Question> q, String category) {
    _questions = List.from(q);
    _currentIndex = 0;
    _score = 0;
    _currentCategory = category;
    notifyListeners();
  }

  void answer(int index) {
    if (isFinished) return;
    if (index >= 0 && index == _questions[_currentIndex].correctIndex) {
      _score++;
    }
    _currentIndex++;
    notifyListeners();
    if (isFinished) _saveScore();
  }

  Future<void> _saveScore() async {
    if (_currentCategory.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    final key = 'lb_$_currentCategory';
    final existing = prefs.getStringList(key) ?? [];
    existing.add(_score.toString());
    existing.sort((a, b) => int.parse(b).compareTo(int.parse(a)));
    await prefs.setStringList(key, existing.take(5).toList());
  }

  static Future<List<int>> getLeaderboard(String category) async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList('lb_$category') ?? []).map(int.parse).toList();
  }
}