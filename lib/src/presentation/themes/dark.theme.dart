import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

//the light theme
ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: primary,
  scaffoldBackgroundColor: const Color(0xff1A1B1F),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: Typography.englishLike2018.apply(
    fontFamily: 'Nunito',
    bodyColor: grayScale50,
    displayColor: grayScale50,
  ),
  primaryTextTheme: Typography.englishLike2018.apply(
    fontFamily: 'Nunito',
    bodyColor: grayScale50,
    displayColor: grayScale50,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: hintTextStyle.copyWith(color: grayScale400),
    constraints: BoxConstraints.tight(
      const Size.fromHeight(56),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    focusedBorder: border(grayScale100),
    border: border(grayScale700),
    enabledBorder: border(grayScale700),
    errorBorder: border(errorDark),
    focusedErrorBorder: border(errorDark),
    isDense: true,
    suffixIconColor: grayScale400,
    prefixIconColor: grayScale400,
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
    color: Color(0xff1A1B1F),
    foregroundColor: white,
    elevation: 0,
    shadowColor: Colors.transparent,
  ),
  iconTheme: const IconThemeData(
    size: 24,
    color: grayScale50,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 4,
    type: BottomNavigationBarType.fixed,
    backgroundColor: grayScale900,
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
