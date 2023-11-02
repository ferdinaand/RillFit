import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../domain/services/themes.services.dart';
import '../../../../../presentation/global_widgets/text.ui.dart';
import '../../../../../presentation/resources/colors.res.dart';

class cartButton extends StatelessWidget {
  const cartButton({
    required this.ontap,
    super.key,
  });
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            color: Get.find<ThemeService>().isDarkMode
                ? grayScale100
                : grayScale900,
            'assets/svg/shopping-cart.svg',
            height: 25,
            width: 25,
          ),
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: TextUi.bodyLarge(
                  '3',
                  color: white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
