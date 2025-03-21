import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(const Color(0xfffce1cf)),
    fillColor: MaterialStateProperty.all(const Color(0xffec9665)),
  ),
  colorScheme: const ColorScheme(
    background: Colors.white,
    primary: Color(0xffec9665),
    secondary: Color(0xFFfce1cf),
    surface: Colors.white,
    error: Color(0xFFea5756),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  hintColor: const Color(0xFF707070),
  textTheme: textThemeLight,
  scaffoldBackgroundColor: const Color(0xfff8f8f8),
);

var darkTheme = ThemeData.dark().copyWith(
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(const Color(0xfffce1cf)),
    fillColor: MaterialStateProperty.all(const Color(0xffec9665)),
  ),
  colorScheme: const ColorScheme(
    background: Colors.black,
    primary: Color(0xffec9665),
    secondary: Color(0xFFfce1cf),
    surface: Colors.black,
    error: Color(0xFFea5756),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  ),
  hintColor: const Color.fromARGB(255, 181, 181, 181),
  textTheme: textThemeDark,
  scaffoldBackgroundColor: Color.fromARGB(255, 21, 21, 21),
);

var textThemeLight = const TextTheme(
  headline1: TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
  headline2: TextStyle(
    fontSize: 30,
    color: Color(0xffec9665),
    fontWeight: FontWeight.bold,
  ),
  subtitle1: TextStyle(
    fontSize: 15,
    color: Color(0xffec9665),
    fontWeight: FontWeight.normal,
  ),
  bodyText1: TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  ),
  bodyText2: TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  ),
  button: TextStyle(
    fontSize: 18,
    color: Color(0xFFFFFFFF),
    fontWeight: FontWeight.normal,
  ),
);

var textThemeDark = const TextTheme(
  headline1: TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
  headline2: TextStyle(
    fontSize: 30,
    color: Color(0xffec9665),
    fontWeight: FontWeight.bold,
  ),
  subtitle1: TextStyle(
    fontSize: 15,
    color: Color(0xFFfce1cf),
    fontWeight: FontWeight.normal,
  ),
  bodyText1: TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  ),
  bodyText2: TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  ),
  button: TextStyle(
    fontSize: 18,
    color: Color(0xFFFFFFFF),
    fontWeight: FontWeight.normal,
  ),
);
