import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controller/gym_tag_controller.dart';

class GymTag extends GetView<GymTagController> {
  const GymTag({super.key});

  @override
  GymTagController get controller => Get.put(GymTagController());

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
                    children: [
                      TextUi.heading2(
                        'Scan QR Code'.toUpperCase(),
                        fontSize: 24,
                      ),
                    ],
                  ),
                  Row(
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
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(color: primary),
                    child: QrImageView(
                      data: '1234567890',
                      version: QrVersions.auto,
                      size: 300,
                    ),
                  ),
                  Gap(20),
                  TextUi.bodyLarge(
                      textAlign: TextAlign.left,
                      ' for  quick and easy access to your gyms, the qr code will contain your gym membership plan info')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
