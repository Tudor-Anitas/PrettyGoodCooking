import 'package:component_library/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_size.dart';

class AppTheme with ChangeNotifier {
  bool isDarkTheme = false;

  static ThemeData get lightTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.bej,
      backgroundColor: AppColors.bej,
      bottomAppBarColor: AppColors.navBarLight,
      primaryColor: AppColors.darkGreen,
      textTheme: TextTheme(
          headline3: GoogleFonts.poppins(
              fontSize: FontSize.xxLarge, color: Colors.black),
          headline4: GoogleFonts.poppins(
              fontSize: FontSize.xLarge, color: Colors.black),
          headline5: GoogleFonts.poppins(
              fontSize: FontSize.large, color: Colors.black),
          headline6: GoogleFonts.poppins(
              fontSize: FontSize.mediumLarge, color: Colors.black),
          bodyText2: GoogleFonts.poppins(
              fontSize: FontSize.medium, color: Colors.black),
          bodyText1: GoogleFonts.poppins(
              fontSize: FontSize.small, color: Colors.black)));

  static ThemeData get darkTheme => ThemeData(
      scaffoldBackgroundColor: Colors.black54,
      backgroundColor: Colors.black54,
      primaryColor: AppColors.darkGreen);

  ThemeData get currentTheme => isDarkTheme ? darkTheme : lightTheme;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
