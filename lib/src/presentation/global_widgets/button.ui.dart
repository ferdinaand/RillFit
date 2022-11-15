// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class ButtonUi extends TextButton {
  final ButtonStyle style;
  final Widget child;
  final VoidCallback? onPressed;

  const ButtonUi({
    super.key,
    required this.style,
    required this.child,
    this.onPressed,
  }) : super(
          style: style,
          onPressed: onPressed,
          child: child,
        );
}

class PrimaryButtonUi extends ButtonUi {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final bool loading;

  PrimaryButtonUi({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.loading = false,
  }) : super(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStateProperty.all(0.0),
            minimumSize: MaterialStateProperty.all(
              Size.fromHeight(56.h),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  smallRadius,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return backgroundColor ?? primary;
                } else if (states.contains(MaterialState.disabled)) {
                  return backgroundColor?.withOpacity(.8) ??
                      primary.withOpacity(.6);
                }
                return backgroundColor ??
                    primary; // Use the component's default.
              },
            ),
          ),
          onPressed: onPressed,
          child: loading
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : TextUi(
                  text,
                  color: textColor,
                  style: buttonTypography,
                ),
        );
}
