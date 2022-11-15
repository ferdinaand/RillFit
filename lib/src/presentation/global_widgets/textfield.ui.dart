import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/themes/app.themes.dart';

class TextFieldUi extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initalValue;
  final InputDecoration? decoration;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  const TextFieldUi({
    super.key,
    required this.hintText,
    this.onChanged,
    this.decoration,
    this.controller,
    this.prefixIcon,
    this.errorStyle,
    this.hintStyle,
    this.suffixIcon,
    this.maxLength,
    this.initalValue,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.inputFormatter,
    this.maxLines = 1,
    this.textStyle,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        maxLines: maxLines,
        maxLength: maxLength,
        autofocus: autofocus,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        keyboardType: keyboardType,
        initialValue: initalValue,
        autocorrect: false,
        focusNode: focusNode,
        inputFormatters: inputFormatter,
        obscureText: obscureText,
        style: hintTextStyle.copyWith(
          fontWeight: FontWeight.w600,
          color: AppThemes.isDarkMode ? grayScale100 : grayScale900,
          height: 1.5,
        ),
        cursorColor: AppThemes.isDarkMode ? grayScale100 : grayScale900,
        cursorWidth: 1,
        textInputAction: textInputAction,
        textAlignVertical: TextAlignVertical.center,
        obscuringCharacter: "●",
        decoration: decoration ??
            InputDecoration(
              hintStyle: hintStyle,
              errorStyle: errorStyle,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconConstraints: const BoxConstraints(
                minHeight: 32,
                minWidth: 32,
              ),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 32,
                minWidth: 32,
              ),
              hintText: hintText,
            ),
      ),
    );
  }
}
