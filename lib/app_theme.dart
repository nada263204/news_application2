import 'package:flutter/material.dart';

class appTheme{
  static Color primaryColor = Color(0XFFA5D6A7);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28)
      )
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400
      ),
    )
  );
}