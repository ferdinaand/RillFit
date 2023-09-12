import 'package:flutter/material.dart'; // ignore_for_file: omit_local_variable_types, unused_element, avoid_void_async, avoid_print

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/navigation.service.dart';
import 'package:riilfit/src/modules/GymOwnerDashboard/plans/presentation/widget/gym.membership.plan.cardUi.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../dashboard/gym/gym_membership_plans/controllers/gym-membership_plans_controller.dart';
import '../controller/gymPlanController.dart';

class ViewGymPlans extends GetView<GymPlanController> {
  const ViewGymPlans({super.key});

  @override
  GymPlanController get controller => Get.put(GymPlanController());

  @override
  Widget build(BuildContext context) {
    final String planId = 'premuim plus';
    final String price = 'N35,000';
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child:
          // controller.isLoading.value
          //     ? Center(
          //         child: CircularProgressIndicator(
          //           color: primary,
          //         ),
          //       )
          //     :
          Scaffold(
        appBar: const MainAppbarUi(title: ''),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        riilfitLogoPng,
                        height: 80,
                        width: 80,
                      )
                    ],
                  ),
                  gymPlanCard(
                    OnTap: () {},
                    Id: '',
                    editAction: controller.navigateToEditpPlanScreen,
                    deleteAction: controller.deletGymPlan,
                    planType: 'basic plan',
                    price: '\N15,000',
                    description:
                        'For those who just want use our  strenght, cardio and free weight equipment.',
                    time: '8:00am to 9:00pm',
                    features: 'Gym access only two days a week',
                    subFeatures: '8 visits per month',
                    logo: riilfitLogoPng,
                  ),
                  const Gap(20),
                  gymPlanCard(
                    OnTap: () {},
                    Id: '',
                    planType: 'premuim',
                    price: '\N20,000',
                    description: '',
                    editAction: controller.navigateToEditpPlanScreen,
                    deleteAction: controller.deletGymPlan,
                    time: '7:00am to 9:00pm',
                    features: 'Gym access only all days a week',
                    subFeatures: '8 visits per month',
                    logo: riilfitLogoPng,
                  ),
                  const Gap(20),
                  gymPlanCard(
                    OnTap: () {},
                    Id: planId,
                    planType: 'premuim plus',
                    price: price,
                    description: '',
                    editAction: controller.navigateToEditpPlanScreen,
                    deleteAction: controller.deletGymPlan,
                    time: '10:00am to 9:00pm',
                    features: 'Gym access 24/7 + plus pool access',
                    subFeatures: 'unlimited visits per month',
                    logo: riilfitLogoPng,
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
