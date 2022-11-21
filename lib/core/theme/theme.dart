import 'package:flutter/material.dart';

const Color firstClr = Color(0xFF274c77);
const Color secondClr = Color(0xCF6096ba);
const Color thirdClr = Color(0xFFa3cef1);
const Color fourthColor = Color(0xFFeaf4f4);
const Color fiveColor = Color(0xFFe7ecef);
const Color white = Colors.white;
const primaryClr = firstClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes with ChangeNotifier {
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      foregroundColor: Colors.black,
    ),
    primaryColor: primaryClr,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black),
      headline4: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      headline5: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
      headline6: TextStyle(color: Colors.black, fontSize: 24),
      subtitle1: TextStyle(color: Colors.black),
      subtitle2: TextStyle(color: Colors.black),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: darkGreyClr),
      labelStyle: TextStyle(color: darkGreyClr),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.green),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.black),
    primaryColor: darkGreyClr,
    backgroundColor: darkHeaderClr,
    brightness: Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.white),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.green),
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.white),
      headline4: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      headline5: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      headline6: TextStyle(color: Colors.white, fontSize: 24),
      subtitle1: TextStyle(color: Colors.white),
      subtitle2: TextStyle(color: Colors.white),
    ),
  );
}
