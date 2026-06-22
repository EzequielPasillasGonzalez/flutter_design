import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: // lerp
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.lerp(
          ThemeData.light(),
          ThemeData.dark(),
          0.8,
        );
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.lerp(ThemeData.light(), ThemeData.dark(), 0.8);
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
