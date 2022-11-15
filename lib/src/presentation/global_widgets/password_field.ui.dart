import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class PasswordFieldUi extends StatelessWidget {
  const PasswordFieldUi({
    required this.hintText,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.controller,
    this.onTap,
  });

  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final obscureText = true.obs;
    return Obx(
      () => TextFieldUi(
        obscureText: obscureText.value,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        hintText: hintText,
        focusNode: focusNode,
        onTap: onTap,
        suffixIcon: GestureDetector(
          onTap: obscureText.toggle,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              obscureText.value ? eyeIcon : slashedEyeIcon,
            ),
          ),
        ),
      ),
    );
  }
}
