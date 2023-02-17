import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';

enum TrainingLevelEnum {
  beginner(successDark),
  amateur(blueColor),
  expert(purple);

  const TrainingLevelEnum(this.color);
  final Color color;
}
