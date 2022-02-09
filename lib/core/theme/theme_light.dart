import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color _baseColor = const Color(0xFF061619);
Color _bgColor = Colors.grey[200]!;

// ignore: non_constant_identifier_names
ThemeData LIGHT_THEME = ThemeData.light().copyWith(
  brightness: Brightness.light,
  canvasColor: Colors.white,
  primaryColorLight: _bgColor,
  primaryColor: _baseColor,
  scaffoldBackgroundColor: _bgColor,
  backgroundColor: _bgColor,
  iconTheme: IconThemeData(color: _baseColor),
  //! Work on below
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(20),
    fillColor: Colors.white,
    focusColor: Colors.white,
    isCollapsed: true,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  ),

  appBarTheme: AppBarTheme(
    elevation: 0.0,
    iconTheme: IconThemeData(color: _baseColor),
    actionsIconTheme: IconThemeData(
      color: _baseColor,
    ),
    backgroundColor: _bgColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      // statusBarColor: Color(0xFF087040),
      statusBarColor: _bgColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: _baseColor,
  ),

  //Regular TextTheme
  textTheme: TextTheme(
    headline1: TextStyle(
      color: _baseColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(
      color: _baseColor,
      fontSize: 15,
    ),
    headline3: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    headline4: const TextStyle(
      color: Colors.white,
      fontSize: 15,
    ),
    bodyText1: const TextStyle(
      color: Colors.black87,
      fontSize: 18,
    ),
    bodyText2: const TextStyle(
      color: Colors.black54,
      fontSize: 15,
    ),
    subtitle1: const TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: _baseColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);
