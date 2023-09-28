import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class TextFieldUi extends StatefulWidget {
  const TextFieldUi({
    super.key,
    required this.hintText,
    required this.controller,
    this.helperText,
    this.onChanged,
    this.decoration,
    this.prefixIcon,
    this.errorStyle,
    this.hintStyle,
    this.suffixIcon,
    this.maxLength,
    this.initalValue,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.alwaysShowHelperText = false,
    this.validator,
    this.inputFormatter,
    this.maxLines = 1,
    this.textStyle,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.enable = true,
    this.autofocus = false,
  });

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
  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final String? helperText;
  final bool alwaysShowHelperText;
  final bool enable;

  @override
  State<TextFieldUi> createState() => _TextFieldUiState();
}

class _TextFieldUiState extends State<TextFieldUi> {
  late FocusNode focusNode;
  late GlobalKey<FormFieldState<String>> _formFieldKey;
  final _showClearButton = false.obs;
  final _hasFocus = false.obs;

  void showBorderMethod() {
    if (focusNode.hasPrimaryFocus && mounted) {
      _hasFocus.value = true;
    } else {
      _hasFocus.value = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _formFieldKey = GlobalKey<FormFieldState<String>>();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(showBorderMethod);
    widget.controller.addListener(() {
      _showClearButton.value = widget.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            enabled: widget.enable,
            key: _formFieldKey,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            autofocus: widget.autofocus,
            validator: widget.validator,
            controller: widget.controller,
            onChanged: (val) {
              focusNode.requestFocus();
              widget.onChanged?.call(val);
            },
            onTap: widget.onTap,
            keyboardType: widget.keyboardType,
            initialValue: widget.initalValue,
            autocorrect: false,
            focusNode: focusNode,
            inputFormatters: widget.inputFormatter,
            obscureText: widget.obscureText,
            style: hintTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: Get.find<ThemeService>().isDarkMode
                  ? grayScale100
                  : grayScale900,
              height: 1.5,
            ),
            cursorColor: Get.find<ThemeService>().isDarkMode
                ? grayScale100
                : grayScale900,
            cursorWidth: 1,
            textInputAction: widget.textInputAction,
            textAlignVertical: TextAlignVertical.center,
            obscuringCharacter: '●',
            decoration: widget.decoration ??
                InputDecoration(
                  hintStyle: widget.hintStyle,
                  errorStyle: widget.errorStyle,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  prefixIconConstraints: const BoxConstraints(
                    minHeight: 32,
                    minWidth: 32,
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    minHeight: 32,
                    minWidth: 32,
                  ),
                  hintText: widget.hintText,
                ),
          ),
          if (widget.helperText != null && _hasFocus.value) ...[
            const Gap(4),
            TextUi.bodySmall(
              widget.helperText!,
              fontSize: 12,
              color: grayScale400,
            ),
          ]
        ],
      ),
    );
  }
}
