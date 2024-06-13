import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_app/config/config.dart';



class AppTheme {
  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: ThemeColors.primaryColor,
      scaffoldBackgroundColor: ThemeColors.primaryColor,
      appBarTheme: const AppBarTheme(backgroundColor: ThemeColors.primaryColor,
      iconTheme: IconThemeData(color: ThemeColors.secondaryColor)),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: ThemeColors.secondaryColor),
        titleMedium: TextStyle(color: ThemeColors.secondaryColor),
        bodyMedium: TextStyle(color: ThemeColors.secondaryColor),
      ));
}
