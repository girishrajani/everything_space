import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: Colors.grey[900],
      // brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[900],
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.green,
      ),
      primaryColor: Colors.black,
      backgroundColor: Colors.grey,
      appBarTheme: AppBarTheme(
          color: Colors.blueGrey[700],
          centerTitle: true,
          foregroundColor: Colors.white),
      cardColor: Colors.grey[700],
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }
}
