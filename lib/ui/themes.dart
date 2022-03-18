import 'package:flutter/material.dart';

class Themes {
  static const TextStyle _defaultTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  static const EdgeInsets screenPadding = EdgeInsets.all(64);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(235, 235, 235, 1),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(242, 243, 255, 1)),
      foregroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(87, 87, 103, 1)), 
      elevation: MaterialStateProperty.all<double>(0), 
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    )),
    dividerColor: const Color.fromRGBO(41, 41, 47, 1),
    textTheme: TextTheme(
      titleLarge: _defaultTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 56, color: Colors.black),
      bodyMedium: _defaultTextStyle.copyWith(fontSize: 18, color: const Color.fromRGBO(87, 87, 103, 1)),
    ),
    //iconTheme: IconThemeData()
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(30, 31, 37, 1),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(36, 36, 45, 1)),
      foregroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(87, 87, 103, 1)), 
      elevation: MaterialStateProperty.all<double>(0), 
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    )),
    dividerColor: const Color.fromRGBO(35, 235, 235, 1),
    textTheme: TextTheme(
      titleLarge: _defaultTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 56, color: Colors.white),
      bodyMedium: _defaultTextStyle.copyWith(fontSize: 18, color: const Color.fromRGBO(218, 218, 218, 1)),
    ),
    //iconTheme: IconThemeData()
  );
}
