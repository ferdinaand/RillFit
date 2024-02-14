// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart'; // ignore_for_file: omit_local_variable_types, unused_element, avoid_void_async, avoid_print

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/Models/gym.plans.models.dart';
import 'package:riilfit/src/domain/services/navigation.service.dart';
import 'package:riilfit/src/modules/GymOwnerDashboard/plans/presentation/widget/gym.membership.plan.cardUi.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../domain/services/themes.services.dart';
import '../../../dashboard/gym/gym_membership_plans/controllers/gym-membership_plans_controller.dart';
import '../controller/gymPlanController.dart';

class ViewGymPlans extends GetView<GymPlanController> {
  ViewGymPlans({super.key});

  @override
  GymPlanController get controller => Get.put(GymPlanController());

  @override
  Widget build(BuildContext context) {
    final List<gymPlans> gymPlanList = controller.thisGymPlans;

    // const String planId = 'premuim plus' ;
    // const String price = 'N35,000' ;
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const MainAppbarUi(title: 'Plans'),
        body: SafeArea(
          child: Obx(
            () => controller.isGymPlanLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: primary,
                  ))
                : ListView.builder(
                    itemCount: gymPlanList.length,
                    itemBuilder: (_, index) {
                      // print(locationList[index].state);
                      final String amount =
                          gymPlanList[index].amount.toString();
                      final String description =
                          gymPlanList[index].description.toString();
                      final String openingTime =
                          gymPlanList[index].openingTime.toString();
                      final String closingTime =
                          gymPlanList[index].closingTime.toString();
                      final String features =
                          gymPlanList[index].priviledges.toString();
                      final String planType =
                          gymPlanList[index].category.toString();
                      final String subFeatures =
                          gymPlanList[index].visitsPerMonth.toString();
                      final String id = gymPlanList[index].id.toString();
                      // String amount = gymPlanList[index].amount.toString();
                      // String amount = gymPlanList[index].amount.toString();
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        child: gymPlanCard(
                          description: description,
                          time: '$openingTime-$closingTime',
                          features: features,
                          subFeatures: subFeatures,
                          logo: '',
                          price: amount,
                          planType: planType,
                          editAction: () {},
                          deleteAction: () {
                            showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor:
                                      Get.find<ThemeService>().isDarkMode
                                          ? Colors.black54
                                          : Colors.black54,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side:
                                          BorderSide(color: primary, width: 2)),
                                  title: const TextUi.heading4(
                                    'Warning!',
                                    color: white,
                                  ),
                                  content: SizedBox(
                                    width: 250.w, // Adjust the width as needed
                                    height: 50.h, // Adjust the height as needed
                                    child: const Center(
                                      child: TextUi.heading3(
                                        'are you sure you want to delete this plan?',
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 50,
                                        right: 50,
                                        bottom: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 50.w,
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Center(
                                                  child: const TextUi.bodyLarge(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: primary,
                                                      'No'),
                                                )),
                                          ),
                                          SizedBox(
                                            width: 50.w,
                                            child: InkWell(
                                                onTap: () async {
                                                  Navigator.of(context).pop();

                                                  await controller
                                                      .deletGymPlan(id);

                                                  if (controller
                                                          .deleted.value ==
                                                      true) {
                                                    await controller
                                                        .fetchGymPlans();
                                                  }
                                                },
                                                child: Center(
                                                  child: const TextUi.bodyLarge(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: primary,
                                                      'Yes'),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          OnTap: () {},
                          Id: '',
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
