import 'package:flutter/material.dart'; // ignore_for_file: omit_local_variable_types, unused_element, avoid_void_async, avoid_print

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/domain/services/navigation.service.dart';
import 'package:riilfit/src/modules/GymOwnerDashboard/plans/presentation/widget/gym.membership.plan.cardUi.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../dashboard/gym/gym_membership_plans/controllers/gym-membership_plans_controller.dart';
import '../controller/gymPlanController.dart';

class CreateGymPlans extends GetView<GymPlanController> {
  const CreateGymPlans({super.key});

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
      child: Scaffold(
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
                  Gap(20),
                  Row(
                    children: [
                      TextUi.bodyLarge(
                        'Plan Price',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Gap(7),
                  SizedBox(
                    child: TextFieldUi(
                        onChanged: (_) {
                          controller.enableButton();
                        },
                        keyboardType: TextInputType.number,
                        helperText:
                            'input price without (,) or any other symbol)',
                        hintText: 'enter your plan price',
                        controller: controller.planPriceController),
                  ),
                  Gap(10),
                  Row(
                    children: [
                      TextUi.bodyLarge(
                        'Plan Description',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Gap(7),
                  SizedBox(
                    child: TextFieldUi(
                        onChanged: (_) {
                          controller.enableButton();
                        },
                        hintText: 'enter plan Discription',
                        controller: controller.planDescriptionController),
                  ),
                  Gap(10),
                  Row(
                    children: [
                      TextUi.bodyLarge(
                        'Plan Type',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Gap(7),
                  Obx(() => SizedBox(
                        height: 70.h,
                        child: DropdownButtonFormField<String>(
                          value: controller.selectedPlanType.value,
                          onChanged: (value) {
                            print(value);
                            controller.selectedPlanType.value = value as String;
                            controller.enableButton();
                          },
                          items: <String>['GOLD', 'PLATINUM', 'EXCLUSIVE']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            hintText: 'Select your plan type',
                            helperText: '(GOLD, PLATINUM, EXCLUSIVE)',
                          ),
                        ),
                      )),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Gap(10),
                          TextUi.bodyLarge(
                            'Open time',
                            fontWeight: FontWeight.bold,
                          ),
                          Gap(7),
                          SizedBox(
                            width: 100,
                            child: TextFieldUi(
                                maxLength: 5,
                                onChanged: (_) {
                                  controller.enableButton();
                                },
                                keyboardType: TextInputType.number,
                                hintText: '00:00',
                                controller: controller.planOpenTimeController),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Gap(10),
                          TextUi.bodyLarge(
                            'Close time',
                            fontWeight: FontWeight.bold,
                          ),
                          Gap(7),
                          SizedBox(
                            width: 100,
                            child: TextFieldUi(
                                maxLength: 5,
                                onChanged: (_) {
                                  controller.enableButton();
                                },
                                keyboardType: TextInputType.number,
                                hintText: '00:00',
                                controller: controller.planCloseTimeController),
                          ),
                        ],
                      )
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      TextUi.bodyLarge(
                        'features',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Gap(7),
                  SizedBox(
                    child: TextFieldUi(
                        onChanged: (_) {
                          controller.enableButton();
                        },
                        hintText: 'list the features of this plan',
                        controller: controller.planFeaturesController),
                  ),
                  Gap(10),
                  Row(
                    children: [
                      TextUi.bodyLarge(
                        'Access days',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Gap(7),
                  SizedBox(
                    child: TextFieldUi(
                        keyboardType: TextInputType.number,
                        onChanged: (_) {
                          controller.enableButton();
                        },
                        maxLength: 1,
                        hintText: 'Gym access days for this plan',
                        controller: controller.planAccessDaysController),
                  ),
                  Gap(40),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primary,
                            ),
                          )
                        : PrimaryButtonUi(
                            text: 'Create',
                            loading: controller.viewState.isBusy,
                            onPressed: controller.isButtonDisabled.value
                                ? null
                                : controller.createPlan,
                          ),
                  ),
                  Gap(32)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
