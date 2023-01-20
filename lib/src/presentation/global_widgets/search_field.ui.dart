import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class SearchFieldUi extends StatelessWidget {
  const SearchFieldUi({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldUi(
      controller: controller,
      hintText: hintText,
      onChanged: onChanged,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SvgPicture.asset(
          searchIcon,
          color: themeService.isDarkMode ? grayScale400 : grayScale700,
        ),
      ),
    );
  }
}
