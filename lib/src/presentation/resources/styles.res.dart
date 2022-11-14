import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

///This file contains other stylings used in the app
///Asides from font and textStyles

OutlineInputBorder border(Color color, {double width = 1}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(smallRadius),
    borderSide: BorderSide(
      color: color,
      width: width,
    ),
  );
}
