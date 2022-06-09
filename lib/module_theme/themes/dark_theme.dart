import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    primaryColor: Colors.redAccent,
    primarySwatch: Colors.red,
    cardColor: const Color(0xFF232323),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF171717),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 23),
        subtitle1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        headline2: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white, selectionColor: Colors.grey),
    inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: const Color(0xFF232323)),
    iconTheme: const IconThemeData(color: Colors.blue),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 23),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0),
    errorColor: Colors.red,
    dividerColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(Colors.transparent),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(Colors.grey[800]),
    )),
    switchTheme:
        SwitchThemeData(thumbColor: MaterialStateProperty.all(Colors.red)),
    canvasColor: Colors.transparent);
