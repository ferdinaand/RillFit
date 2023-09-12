import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../gym_membership_plans/controllers/gym-membership_plans_controller.dart';
import '../controller/gym_tag_controller.dart';

class GymTag extends GetView<GymPlansController> {
  const GymTag({super.key});

  @override
  GymPlansController get controller => Get.put(GymPlansController());

  @override
  Widget build(BuildContext context) {
    final selectedPlanId = controller.selectedPlanId.value;
    final selectedPlanType = controller.selectedPlanType.value;
    final selectedPlanPrice = controller.selectedPlanPrice.value;
    final subscriberName = controller.subscribersName.value;
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const MainAppbarUi(
          title: '',
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 36, right: 36),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      riilfitLogoPng,
                      height: 28.h,
                    ),
                  ),
                  const Gap(43),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUi.heading2(
                        'Scan QR Code'.toUpperCase(),
                        fontSize: 24,
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUi.bodyLarge(
                        'Scan the QR to check your subscription\ninfo on time!!',
                        fontSize: 15,
                      ),
                    ],
                  ),
                  const Gap(30),
                  // SizedBox(
                  //   height: 311,
                  //   width: 311,
                  //   child: Image.asset(qrCodeSample),
                  // ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primary, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(35),
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(color: primary),
                        child: QrImageView(
                          data:
                              '$selectedPlanId, $selectedPlanPrice, $selectedPlanType, $subscriberName',
                          version: QrVersions.auto,
                          size: 300,
                        ),
                      ),
                    ),
                  ),
                  const Gap(40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUi.bodyLarge(
                          textAlign: TextAlign.center,
                          ' for  quick and easy access to your gyms,\n the qr code will contain your gym \n membership plan info'),
                    ],
                  ),
                  const Gap(30),
                  SizedBox(
                    height: 50.h,
                    width: 350,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => primary)),
                        onPressed: () {},
                        child: const TextUi.bodyLarge('Proceed')),
                  ),
                  const Gap(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
