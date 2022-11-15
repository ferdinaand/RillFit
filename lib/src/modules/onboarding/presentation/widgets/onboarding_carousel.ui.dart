import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/onboarding_carousel.dummy.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/themes/app.themes.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class OnBoardingCarouselUi extends StatelessWidget {
  const OnBoardingCarouselUi({
    super.key,
    required this.content,
  });

  final OnboardingCarouselSkeleton content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            content.image,
            width: context.width,
            height: context.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        const Gap(24),
        TextUi.heading3(
          content.title,
        ),
        const Gap(8),
        Obx(
          () => TextUi.bodySmall(
            content.description,
            color: AppThemes.isDarkMode ? grayScale100 : grayScale700,
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 12),
        ),
        const Gap(24),
      ],
    );
  }
}
