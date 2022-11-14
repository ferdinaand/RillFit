import 'package:flutter/material.dart';

//TODO Complete dark mode of the app
//the dark theme
ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  textTheme: Typography.englishLike2018.apply(
    fontFamily: "SFProDisplay",
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
