import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_app/config/config.dart';



class AppTheme {
  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: ThemeColors.primaryColor,
      scaffoldBackgroundColor: ThemeColors.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeColors.primaryColor,
      foregroundColor: ThemeColors.secondaryColor,
       elevation: 4,
        shadowColor: ThemeColors.primaryColor,
        surfaceTintColor: ThemeColors.primaryColor,
        centerTitle: true
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: ThemeColors.secondaryColor),
        titleMedium: TextStyle(color: ThemeColors.secondaryColor),
        bodyMedium: TextStyle(color: ThemeColors.secondaryColor),
      ));
}
