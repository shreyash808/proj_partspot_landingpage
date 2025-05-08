import 'package:flutter/material.dart';

abstract class AppTheme {
  Color get primaryColor;
  Color get backgroundColor;
  Color get textColor;
  Color get accentColor;
  Color get appThemeGradient1;
  Color get appThemeGradient2;
  ThemeData themeData(BuildContext context);
}
