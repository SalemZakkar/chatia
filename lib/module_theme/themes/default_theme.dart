import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
    primaryColor: Colors.blue,
    primarySwatch: Colors.blue,
    cardColor: const Color(0xFFEEEEEE),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: Colors.black),
      bodyText1: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 23),
      bodyText2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      headline2: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black, selectionColor: Colors.grey),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
        prefixStyle: const TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: const Color(0xFFEEEEEE)),
    iconTheme: const IconThemeData(color: Colors.blue),
    appBarTheme: const AppBarTheme(
        //titleTextStyle: TextStyle(color: Colors.black , fontSize: 30),
        centerTitle: true,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 23),
        elevation: 0),
    errorColor: Colors.red,
    canvasColor: Colors.transparent);
