import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../routing/app_pages.dart';
import '../controller/gym_profile_controller.dart';
import '../widgets/gym_profile_options.dart';
import '../widgets/header.ui.dart';

class GymProfile extends GetView<GymProfileController> {
  const GymProfile({super.key});

  @override
  GymProfileController get controller => Get.put(GymProfileController());

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
        appBar: MainAppbarUi(title: ''),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    riilfitLogoPng,
                    height: 28.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 34, right: 34, top: 30),
                  child: Column(
                    children: [
                      const GymProfileHeaderUi(),
                      Row(
                        children: [
                          TextUi.heading1('Gym profile'),
                        ],
                      ),
                    ],
                  ),
                ),
                GymOptionCard(
                  title: 'SCAN',
                  description: 'Scan the QR and update your info on time!!',
                  iconPath: 'assets/png/scan.png',
                  onTap: () {
                    Get.offAndToNamed<void>(
                      Routes.gymTag,
                    );
                  },
                ),
                GymOptionCard(
                  title: 'PLANS',
                  description: 'Checkout Price plans that works for you',
                  iconPath: 'assets/png/emoji-happy.png',
                  onTap: () {
                    Get.offAndToNamed<void>(
                      Routes.gymPlan,
                    );
                  },
                ),
                GymOptionCard(
                  title: 'CLASSES',
                  description: 'Select Classes that workswith your schedule',
                  iconPath: 'assets/png/weight.png',
                  onTap: () {
                    Get.offAndToNamed<void>(
                      Routes.gymTag,
                    );
                  },
                ),
                GymOptionCard(
                  title: 'PROFILE',
                  description: 'All information are on the profile ',
                  iconPath: 'assets/png/tag-user.png',
                  onTap: () {
                    Get.offAndToNamed<void>(
                      Routes.profile,
                    );
                  },
                ),
                const Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
