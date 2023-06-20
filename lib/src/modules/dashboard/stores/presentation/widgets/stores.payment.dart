import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/onboarding_carousel.dummy.dart';
import 'package:riilfit/src/modules/onboarding/controller/onboarding.controller.dart';
import 'package:riilfit/src/modules/onboarding/presentation/widgets/onboarding_carousel.ui.dart';
import 'package:riilfit/src/modules/onboarding/presentation/widgets/page_indicator.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class StorePaymentController extends GetView<OnboardingController> {
  const StorePaymentController({super.key});

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
        body: Column(),
      ),
    );
  }
}
