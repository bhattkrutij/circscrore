import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: scaffoldBgColor,
    primaryColor: primaryColor, // Green
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: textColorPrimary), // Dark Gray
    //   bodyMedium: TextStyle(color: textColorSecondary), // Gray
    // ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: inputFieldBgColor,
      border: OutlineInputBorder(borderSide: BorderSide(color: inputFieldBorderColor)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: inputFieldBorderColor),
      ),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: inputFieldBorderColor)),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor),
      ),
      hintStyle: TextStyle(color: textColorSecondary, fontWeight: FontWeight.w500),
      errorStyle: TextStyle(color: errorColor), // Red
    ),
    dividerColor: borderColor,
  );
}