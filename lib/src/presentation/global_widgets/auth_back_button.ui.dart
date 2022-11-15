import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

class AuthBackButtonUi extends StatelessWidget {
  const AuthBackButtonUi({
    super.key,
    this.iconColor,
    this.size,
  });

  final Color? iconColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Back",
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 8),
        child: InkWell(
          onTap: Get.back,
          borderRadius: const BorderRadius.all(
            regularRadius,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                regularRadius,
              ),
              border: Border.all(
                color: iconColor ?? grayScale700,
              ),
            ),
            child: SvgPicture.asset(
              backIcon,
              fit: BoxFit.none,
              color: iconColor ?? grayScale700,
              width: size,
              height: size,
            ),
          ),
        ),
      ),
    );
  }
}
