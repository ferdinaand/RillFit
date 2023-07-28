import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/navigation.service.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../routing/app_pages.dart';
import '../controllers/gym-membership_plans_controller.dart';
import '../widgets/gym.membership.plan.cardUi.dart';

class GymMembershipPlans extends GetView<GymPlansController> {
  const GymMembershipPlans({super.key});

  @override
  GymPlansController get controller => Get.put(GymPlansController());

  @override
  Widget build(BuildContext context) {
    final String planId = 'premuim plus';
    final String price = '20';
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
                            TextUi.heading2('Plans'),
                          ],
                        ),
                        const Gap(17),
                        Row(
                          children: [
                            TextUi.bodyLarge(
                                'Checkout Price plans that works for you'),
                          ],
                        ),
                        gymPlanCard(
                          OnTap: () {
                            controller.enableButton();
                          },
                          Id: '',
                          planType: 'basic plan',
                          price: '\$49',
                          description:
                              'For those who just want use our  strenght, cardio and free weight equipment.',
                          time: '8:00am to 9:00pm',
                          features: 'Gym access only two days a week',
                          subFeatures: '8 visits per month',
                          logo: riilfitLogoPng,
                        ),
                        const Gap(20),
                        gymPlanCard(
                          OnTap: () {
                            controller.enableButton();
                          },
                          Id: '',
                          planType: 'premuim',
                          price: '\$90',
                          description: '',
                          time: '7:00am to 9:00pm',
                          features: 'Gym access only all days a week',
                          subFeatures: '8 visits per month',
                          logo: riilfitLogoPng,
                        ),
                        const Gap(20),
                        gymPlanCard(
                          OnTap: () {
                            controller.enableButton();
                          },
                          Id: planId,
                          planType: 'premuim plus',
                          price: price,
                          description: '',
                          time: '10:00am to 9:00pm',
                          features:
                              'Gym access only all days of the week, plus pool access',
                          subFeatures: 'unlimited visits per month',
                          logo: riilfitLogoPng,
                        ),
                        const Gap(20),
                        PrimaryButtonUi(text: 'subscribe', onPressed: () {}),
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
