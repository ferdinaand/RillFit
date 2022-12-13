import 'package:flutter/widgets.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

enum ErrorType {
  success(successDark),
  failed(errorDark);

  const ErrorType(this.color);
  final Color color;
}

extension ViewStateX on ErrorType {
  bool get isSuccess => this == ErrorType.success;
  bool get isFailure => this == ErrorType.failed;
}
