import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

//the light theme
ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: primary,
  scaffoldBackgroundColor: white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: Typography.englishLike2018.apply(
    fontFamily: 'Nunito',
    bodyColor: grayScale900,
    displayColor: grayScale900,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: hintTextStyle.copyWith(color: grayScale700),
    constraints: BoxConstraints.tight(
      const Size.fromHeight(56),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    focusedBorder: border(grayScale700),
    border: border(grayScale100),
    enabledBorder: border(grayScale100),
    errorBorder: border(errorDark),
    focusedErrorBorder: border(errorDark),
    isDense: true,
    errorStyle: const TextStyle(fontSize: 0, height: 0),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(white),
      backgroundColor: MaterialStateProperty.all(primary),
      alignment: Alignment.center,
      textStyle: MaterialStateProperty.all(buttonTypography),
      elevation: MaterialStateProperty.all(0),
      minimumSize: MaterialStateProperty.all(
        const Size.fromHeight(48),
      ),
      shape: MaterialStateProperty.all(
        const StadiumBorder(),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: white,
    foregroundColor: grayScale900,
    elevation: 0,
    shadowColor: Colors.transparent,
  ),
  iconTheme: const IconThemeData(
    size: 24,
    color: grayScale900,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 4,
    type: BottomNavigationBarType.fixed,
    backgroundColor: white,
    selectedItemColor: primary,
    unselectedItemColor: grayScale500,
    selectedIconTheme: const IconThemeData(color: primary, size: 20),
    unselectedIconTheme: const IconThemeData(color: grayScale500, size: 20),
    selectedLabelStyle: bodyMed.copyWith(
      color: primary,
    ),
    unselectedLabelStyle: bodyMed,
    showUnselectedLabels: true,
  ),
);
