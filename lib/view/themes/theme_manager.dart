import 'package:flutter/material.dart';
import 'dark_theme.dart';

class ThemeManager {
  static DarkTheme _darkTheme = DarkTheme();
  // static LightTheme _lightTheme = LightTheme();

  static ThemeData get darkTheme => _darkTheme.theme;
  // static ThemeData get lightTheme => _lightTheme.theme;
}
