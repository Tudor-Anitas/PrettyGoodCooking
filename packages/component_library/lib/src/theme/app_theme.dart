import 'package:component_library/src/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  bool isDarkTheme = false;

  static ThemeData get lightTheme => ThemeData(
      scaffoldBackgroundColor: bej,
      backgroundColor: bej,
      bottomAppBarColor: navBarLight,
      primaryColor: darkGreen);

  static ThemeData get darkTheme => ThemeData(
      scaffoldBackgroundColor: Colors.black54,
      backgroundColor: Colors.black54,
      primaryColor: darkGreen);

  ThemeData get currentTheme => isDarkTheme ? darkTheme : lightTheme;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
