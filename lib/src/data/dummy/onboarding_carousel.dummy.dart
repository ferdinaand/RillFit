import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

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
      padding: EdgeInsets.only(top: 90),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Positioned(
              top: 20,
              child: Container(
                height: 359.h,
                width: 259.w,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          Positioned(
            top: -120,
            left: -13,
            child: Image.asset(
              imagePlaceholder,
              width: 319.57.h,
              height: 491.94.w,
            ),
          )
        ],
      ),
    ),
    description:
        'Riilfit has workouts on demand that you can find based on how much time you have',
  ),
  OnboardingCarouselSkeleton(
    title: 'Access workout Routines',
    image: Padding(
      padding: EdgeInsets.only(top: 90),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 359.h,
              width: 259.w,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Positioned(
            top: -100,
            left: 70,
            child: Image.asset(
              imagePlaceholder2,
              width: 235.57.h,
              height: 460.94.w,
            ),
          )
        ],
      ),
    ),
    description:
        'Workout categories will help you gain strength, get in better shape and embrace a healthy lifestyle',
  ),
  OnboardingCarouselSkeleton(
    title: 'Shop For Suppliments',
    image: Padding(
      padding: EdgeInsets.only(top: 90),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 359.h,
              width: 259.w,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Positioned(
            top: -10,
            left: 25,
            child: Image.asset(
              imagePlaceholder3,
              width: 284.47.h,
              height: 357.w,
            ),
          )
        ],
      ),
    ),
    description:
        'Find exclusive deals on popular products and get the items you love delivered or ready for pickup.',
  ),
];
