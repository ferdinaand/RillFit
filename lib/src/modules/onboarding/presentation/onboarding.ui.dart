import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/onboarding_carousel.dummy.dart';
import 'package:riilfit/src/modules/onboarding/controller/onboarding.controller.dart';
import 'package:riilfit/src/modules/onboarding/presentation/widgets/onboarding_carousel.ui.dart';
import 'package:riilfit/src/modules/onboarding/presentation/widgets/page_indicator.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class OnboardingUi extends GetView<OnboardingController> {
  const OnboardingUi({super.key});

  @override
  OnboardingController get controller => Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: baseViewPadding,
                sliver: SliverFillRemaining(
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: controller.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: onboardingCarouselContent.length,
                          restorationId: 'onboarding',
                          onPageChanged: (i) => controller.currentIndex = i,
                          scrollBehavior: const ScrollBehavior().copyWith(
                            overscroll: false,
                          ),
                          itemBuilder: (_, i) {
                            final content = onboardingCarouselContent[i];
                            return OnBoardingCarouselUi(
                              content: content,
                            );
                          },
                        ),
                      ),
                      const OnboardingPageIndicator(),
                      const Gap(32),
                      SizedBox(
                        height: 48.h,
                        width: 241.w,
                        child: PrimaryButtonUi(
                          text: 'Get Started',
                          onPressed: controller.navigateToRegisterPage,
                        ),
                      ),
                      const Gap(82),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
