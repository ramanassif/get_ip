import 'package:flutter/material.dart';


class ThemeServices with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeServices({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}