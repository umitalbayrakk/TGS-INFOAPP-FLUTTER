import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeProvider({ThemeMode initialTheme = ThemeMode.system}) : _themeMode = initialTheme {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> setTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners(); 
    await _saveTheme(themeMode); 
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('themeMode') ?? ThemeMode.system.index;
    _themeMode = ThemeMode.values[themeIndex];
    notifyListeners();
  }

  Future<void> _saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeMode.index);
  }
}
