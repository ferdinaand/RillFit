import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:riilfit/src/data/enum/error_type.enum.dart';
import 'package:riilfit/src/presentation/resources/weights.res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

void showFlushBar({
  required String message,
  ErrorType errorType = ErrorType.failed,
}) {
  showSimpleNotification(
    TextUi.bodySmall(
      message,
      textAlign: TextAlign.center,
      fontWeight: mediumText,
      color: Colors.white,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    background: errorType.color,
    duration: const Duration(seconds: 2),
  );
}
