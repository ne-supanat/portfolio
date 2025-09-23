import 'package:flutter/material.dart';

const primaryColor = Color(0xff41465E);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xffFAFCFF),
  primaryColor: primaryColor,
  iconTheme: IconThemeData(color: primaryColor),
  textTheme: TextTheme(
    titleLarge: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: primaryColor, fontSize: 16),
    labelMedium: TextStyle(color: primaryColor, fontSize: 16),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: primaryColor,
  primaryColor: primaryColor,
  iconTheme: IconThemeData(color: primaryColor),
  textTheme: TextTheme(
    titleLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: primaryColor, fontSize: 16),
    labelMedium: TextStyle(color: Colors.white, fontSize: 16),
  ),
);
