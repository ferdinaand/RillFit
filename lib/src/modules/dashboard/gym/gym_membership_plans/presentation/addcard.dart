// ignore_for_file: omit_local_variable_types, unused_element, avoid_void_async, avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/navigation.service.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_membership_plans/presentation/widgets/cardUi.dart';
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

class AddCardScreen extends GetView<GymPlansController> {
  const AddCardScreen({super.key});

  @override
  GymPlansController get controller => Get.put(GymPlansController());

  @override
  Widget build(BuildContext context) {
    final String planId = 'premuim plus';
    final String price = 'N35,000';
    final String plantype = 'N35,000';
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: primary,
              ),
            )
          : Scaffold(
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
                            TextUi.heading2('Payment Plans'),
                          ],
                        ),
                        const Gap(17),
                        Row(
                          children: [
                            TextUi.bodyLarge('Select Card'),
                          ],
                        ),
                        Gap(20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              cardUi(),
                              Gap(30),
                              cardUi(),
                              Gap(30),
                              cardUi(),
                              Gap(30),
                              cardUi(),
                              Gap(30),
                              cardUi(),
                              Gap(30),
                              cardUi(),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const Gap(31),

                            const Gap(7),
                            SizedBox(
                              child: TextFieldUi(
                                onChanged: (_) {
                                  // controller.enableButton();
                                },
                                hintText: 'Card Holder Name',
                                controller: controller.Controller,
                              ),
                            ),
                            const Gap(20),

                            const Gap(7),
                            SizedBox(
                              child: TextFieldUi(
                                onChanged: (_) {
                                  // controller.enableButton();
                                },
                                hintText: 'Card Number',
                                controller: controller.Controller,
                              ),
                            ),
                            const Gap(15),

                            //Gym lodation details form
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Gap(7),
                                    SizedBox(
                                      width: 170.w,
                                      child: TextFieldUi(
                                        onChanged: (_) {
                                          // controller.enableButton();
                                        },
                                        hintText: 'Expiry Date',
                                        controller: controller.Controller,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Gap(7),
                                    SizedBox(
                                      width: 170.w,
                                      child: TextFieldUi(
                                        onChanged: (_) {
                                          // controller.enableButton();
                                        },
                                        hintText: 'Security Code',
                                        controller: controller.Controller,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Gap(20),

                            const Gap(7),
                            SizedBox(
                              child: TextFieldUi(
                                onChanged: (_) {
                                  // controller.enableButton();
                                },
                                hintText: 'cvv',
                                controller: controller.Controller,
                              ),
                            ),
                            const Gap(15),
                          ],
                        ),
                        const Gap(30),
                        Obx(
                          () => controller.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: primary,
                                ))
                              : PrimaryButtonUi(
                                  text: 'Add Card',
                                  onPressed: () {
                                    // ignore: inference_failure_on_function_invocation
                                    Get.toNamed(Routes.openWebView);
                                  }),
                        ),
                        const Gap(20)
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
