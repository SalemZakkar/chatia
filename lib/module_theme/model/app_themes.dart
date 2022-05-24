import 'package:chatia/module_theme/themes/dark_theme.dart';
import 'package:chatia/module_theme/themes/default_theme.dart';
import 'package:flutter/material.dart';

class AppThemes {
static List<ThemeData> themes = [
  defaultTheme,
  darkTheme
];
}
int activeTheme = 0;