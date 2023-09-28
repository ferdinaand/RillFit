// ignore_for_file: omit_local_variable_types, unused_element, avoid_void_async, avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/Models/gym.plans.models.dart';
import 'package:riilfit/src/domain/services/navigation.service.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';
import 'package:mono_flutter/mono_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../routing/app_pages.dart';
import '../controllers/gym-membership_plans_controller.dart';
import 'widgets/gym.membership.plan.cardUi.dart';

class GymMembershipPlans extends GetView<GymPlansController> {
  const GymMembershipPlans({super.key});

  @override
  GymPlansController get controller => Get.put(GymPlansController());

  @override
  Widget build(BuildContext context) {
    final List<gymPlans> gymPlanList = controller.thisGymPlans;
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const MainAppbarUi(title: ''),
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
                      return Column(
                        children: [
                          Padding(
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
                              OnTap: () {},
                              Id: '',
                            ),
                          ),
                          Obx(
                            () => controller.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: primary,
                                  ))
                                : PrimaryButtonUi(
                                    text: 'subscribe',
                                    onPressed: () {
                                      // ignore: inference_failure_on_function_invocation
                                      Get.toNamed(Routes.addCard);
                                    }),
                          ),
                          const Gap(20)
                        ],
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
