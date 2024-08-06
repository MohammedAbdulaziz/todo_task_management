import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24.0,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.0,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.0,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 12.0, color: Colors.black54),
      bodySmall: TextStyle(fontSize: 16.0, color: Colors.black54),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.grey.withOpacity(0.5),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.grey;
          }
          return Colors.transparent;
        },
      ),
      checkColor: MaterialStateProperty.all(Colors.black),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.blue,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      background: Colors.white,
      onBackground: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 3, 78, 78),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 12.0, color: Colors.white),
      bodySmall: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
      shadowColor: Colors.black.withOpacity(0.65),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.grey;
          }
          return Colors.transparent;
        },
      ),
      checkColor: MaterialStateProperty.all(Colors.black),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.blue,
      onSecondary: Colors.white,
      surface: Colors.grey[900] ?? Colors.black,
      onSurface: Colors.white,
      background: Colors.black,
      onBackground: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
  );
}
