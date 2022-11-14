import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:riilfit/src/data/dummy/onboarding_carousel.dummy.dart';
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
        TextUi.bodySmall(
          content.description,
          textAlign: TextAlign.center,
        ),
        const Gap(24),
      ],
    );
  }
}
