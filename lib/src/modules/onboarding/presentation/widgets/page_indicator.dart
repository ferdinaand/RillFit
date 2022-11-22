import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/onboarding_carousel.dummy.dart';
import 'package:riilfit/src/modules/onboarding/controller/onboarding.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

class OnboardingPageIndicator extends GetView<OnboardingController> {
  const OnboardingPageIndicator({
    super.key,
  });

  @override
  OnboardingController get controller => Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: onboardingCarouselContent.asMap().entries.map((entry) {
        final index = entry.key;
        return Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 10.0.w,
            height: 10.0.h,
            margin: EdgeInsets.symmetric(
              horizontal: 7.5.w,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.currentIndex == index ? primary : grayScale100,
            ),
          ),
        );
      }).toList(),
    );
  }
}
