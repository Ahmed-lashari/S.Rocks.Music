// this clas will containt the common theme properties of the app
import 'package:flutter/material.dart';

class ThemeConsts {
  // textual theme
  static TextTheme textTheme = TextTheme(
    // large texts
    displayLarge: _buildTextStyle(AppTypoGraphy.bold),
    headlineLarge: _buildTextStyle(AppTypoGraphy.bold),
    headlineMedium: _buildTextStyle(AppTypoGraphy.bold),
    headlineSmall: _buildTextStyle(AppTypoGraphy.bold),
    displayMedium: _buildTextStyle(AppTypoGraphy.bold),
    titleLarge: _buildTextStyle(AppTypoGraphy.bold),
    titleSmall: _buildTextStyle(AppTypoGraphy.bold),
    titleMedium: _buildTextStyle(AppTypoGraphy.bold),

    // small texts
    labelLarge: _buildTextStyle(AppTypoGraphy.regular),
    labelMedium: _buildTextStyle(AppTypoGraphy.regular),
    labelSmall: _buildTextStyle(AppTypoGraphy.regular),
    bodyLarge: _buildTextStyle(AppTypoGraphy.regular),
    bodyMedium: _buildTextStyle(AppTypoGraphy.regular),
    bodySmall: _buildTextStyle(AppTypoGraphy.regular),
    displaySmall: _buildTextStyle(AppTypoGraphy.regular),
  );
  static TextStyle _buildTextStyle(String fontType) {
    return TextStyle(fontFamily: fontType);
  }
}

class AppTypoGraphy {
  static const String _regular = "SyneRegularFont";
  static const String _bold = "SyneBoldFont";
  static const String _lobster = "LobsterFont";

  static String get regular => _regular;
  static String get bold => _bold;
  static String get lobster => _lobster;
}
