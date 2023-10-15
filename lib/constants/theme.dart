import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.green,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.green,
          textStyle: const TextStyle(color: Colors.green),
          surfaceTintColor: Colors.green,
          shadowColor: Colors.green,
          side: const BorderSide(color: Colors.green, width: 1.7)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: outlineInputBorder,
      errorBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      prefixIconColor: Colors.grey,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        textStyle: const TextStyle(
          fontSize: 18.0,
        ),
        disabledBackgroundColor: Colors.grey,
      ),
    ),
    canvasColor: Colors.green,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.8,
        toolbarTextStyle: TextStyle(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.black)));

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);
