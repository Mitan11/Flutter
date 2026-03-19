import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;

  ThemeProvider() {
    _load();
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode =
        (prefs.getBool('isDark') ?? false) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toggle() async {
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
    notifyListeners();
  }
}
