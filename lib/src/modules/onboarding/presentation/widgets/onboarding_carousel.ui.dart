import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/onboarding_carousel.dummy.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
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
          child: SvgPicture.asset(
            content.image,
            width: context.width,
            height: context.width,
            fit: BoxFit.none,
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
            color: Get.find<ThemeService>().isDarkMode
                ? grayScale100
                : grayScale700,
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 12),
        ),
        const Gap(24),
      ],
    );
  }
}
