import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color _baseColor = const Color(0XFF061619);
Color _bgColor = const Color(0XFF0d2023);

// ignore: non_constant_identifier_names
ThemeData DARK_THEME = ThemeData.dark().copyWith(
  primaryColor: _baseColor,
  primaryColorLight: const Color(0XFFdf9300),
  // primaryColorLight: Colors.white,
  cardColor: _baseColor,
  scaffoldBackgroundColor: _bgColor,
  brightness: Brightness.light,
  tabBarTheme: const TabBarTheme(labelColor: Colors.white),
  canvasColor: _bgColor,
  backgroundColor: _bgColor,
  iconTheme: const IconThemeData(color: Colors.white),

  appBarTheme: AppBarTheme(
    elevation: 0.0,
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: _bgColor,
    actionsIconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      // statusBarColor: Colors.grey[200],
      statusBarColor: _bgColor,
      statusBarIconBrightness: Brightness.light,
    ),
  ),

  //! Input
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(20),
    fillColor: _baseColor,
    focusColor: _baseColor,
    isCollapsed: true,
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 15,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 15,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 15,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    // subtitle1: const TextStyle(color: Colors.blueGrey),
  ),
);
