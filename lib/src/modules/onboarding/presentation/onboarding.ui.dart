import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/onboarding_carousel.dummy.dart';
import 'package:riilfit/src/modules/onboarding/controller/onboarding.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import 'widgets/onboarding_carousel.ui.dart';
import 'widgets/page_indicator.dart';

class OnboardingUi extends GetView {
  const OnboardingUi({super.key});

  @override
  OnboardingController get controller => Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
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
                      const Gap(48),
                      Expanded(
                        child: PageView.builder(
                          controller: controller.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: onboardingCarouselContent.length,
                          restorationId: "onboarding",
                          onPageChanged: (i) => controller.currentIndex,
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
                      PrimaryButtonUi(
                        text: 'Get Started',
                        onPressed: controller.navigateToRegisterPage,
                      ),
                      const Gap(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextUi.bodyMed(
                            "Already have an account? ",
                          ),
                          GestureDetector(
                            onTap: controller.navigateToLoginPage,
                            child: const TextUi.bodyMed(
                              "Sign in",
                              color: primary,
                              fontWeight: semiBoldText,
                            ),
                          ),
                        ],
                      ),
                      const Gap(32),
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
