import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

class PinFieldUi extends StatelessWidget {
  const PinFieldUi({
    super.key,
    required this.onChanged,
    required this.controller,
    this.onCompleted,
    this.onSubmitted,
    this.autofocus = true,
    this.obscureText = true,
    this.length = 6,
    this.horizontalPadding = 16.0,
  });

  final void Function(String) onChanged;
  final void Function(String)? onCompleted;
  final void Function(String)? onSubmitted;
  final bool autofocus;
  final bool obscureText;
  final TextEditingController controller;
  final int length;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      child: Obx(
        () => PinCodeTextField(
          appContext: context,
          length: length,
          controller: controller,
          autoDisposeControllers: false,
          autoFocus: autofocus,
          obscureText: obscureText,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          useHapticFeedback: true,
          textStyle: heading4,
          pastedTextStyle: heading4,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            fieldHeight: 48,
            fieldWidth: 48,
            inactiveFillColor: Colors.transparent,
            activeFillColor: Colors.transparent,
            selectedFillColor: Colors.transparent,
            borderWidth: 2,
            borderRadius: const BorderRadius.all(
              regularRadius,
            ),
            activeColor: Get.find<ThemeService>().isDarkMode
                ? grayScale500
                : grayScale50,
            selectedColor: primary,
            inactiveColor: Get.find<ThemeService>().isDarkMode
                ? grayScale500
                : grayScale50,
          ),
          cursorColor: primary,
          cursorHeight: 24,
          enableActiveFill: true,
          animationDuration: const Duration(milliseconds: 300),
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          onCompleted: onCompleted,
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
