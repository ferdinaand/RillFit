import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/themes/app.themes.dart';

class AuthBackButtonUi extends StatelessWidget {
  const AuthBackButtonUi({
    super.key,
    this.size,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Back",
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
        child: InkWell(
          onTap: Get.back,
          borderRadius: const BorderRadius.all(
            regularRadius,
          ),
          child: Obx(
            () => DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  regularRadius,
                ),
                border: Border.all(
                  color: grayScale100,
                ),
              ),
              child: SvgPicture.asset(
                backIcon,
                fit: BoxFit.none,
                color: AppThemes.isDarkMode ? grayScale100 : grayScale900,
                width: size,
                height: size,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
