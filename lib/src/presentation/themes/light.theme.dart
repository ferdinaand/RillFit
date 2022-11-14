import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

//the light theme
ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: white,
  textTheme: Typography.englishLike2018.apply(
    fontFamily: "Nunito",
    bodyColor: primary500,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: hintTextStyle,
    fillColor: grayScale50,
    constraints: BoxConstraints.tight(
      const Size.fromHeight(48),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 14.0,
    ),
    focusedBorder: border(primary),
    border: border(grayScale50),
    enabledBorder: border(grayScale50),
    errorBorder: border(errorDark),
    focusedErrorBorder: border(errorDark),
    filled: true,
    isDense: true,
    errorStyle: const TextStyle(fontSize: 0, height: 0),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    foregroundColor: Colors.white,
    elevation: 0,
    shadowColor: Colors.transparent,
  ),
  iconTheme: const IconThemeData(
    size: 24,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
