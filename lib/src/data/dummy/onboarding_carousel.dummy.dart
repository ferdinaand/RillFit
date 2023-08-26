import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:get/get.dart';
import '../../domain/services/themes.services.dart';

class OnboardingCarouselSkeleton {
  const OnboardingCarouselSkeleton({
    required this.title,
    required this.image,
    required this.description,
  });

  final Widget image;
  final String title;
  final String description;
}

final onboardingCarouselContent = <OnboardingCarouselSkeleton>[
  OnboardingCarouselSkeleton(
    title: 'Find gyms near you',
    image: Padding(
      padding: const EdgeInsets.only(right: 69),
      child: Expanded(
        child: Image.asset(Get.find<ThemeService>().isDarkMode
            ? darkOnboardingImage1
            : lightOnboardingImage1),
      ),
    ),
    description:
        'Riilfit has workouts on demand that you can find based on how much time you have',
  ),
  OnboardingCarouselSkeleton(
    title: 'Access workout Routines',
    image: Padding(
      padding: const EdgeInsets.only(right: 69),
      child: Expanded(
        child: Image.asset(Get.find<ThemeService>().isDarkMode
            ? darkOnboardingImage2
            : lightOnboardingImage2),
      ),
    ),
    description:
        'Workout categories will help you gain strength, get in better shape and embrace a healthy lifestyle',
  ),
  OnboardingCarouselSkeleton(
    title: 'Shop For Suppliments',
    image: Padding(
        padding: const EdgeInsets.only(right: 69),
        child: Expanded(
          child: Image.asset(Get.find<ThemeService>().isDarkMode
              ? darkOnboardingImage3
              : lightOnboardingImage3),
        )),
    description:
        'Find exclusive deals on popular products and get the items you love delivered or ready for pickup.',
  ),
];
