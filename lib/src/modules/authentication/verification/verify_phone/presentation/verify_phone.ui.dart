import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/data/extensions/extensions.dart';
import 'package:riilfit/src/modules/authentication/verification/verify_phone/controller/verify_phone.controller.dart';
import 'package:riilfit/src/presentation/global_widgets/network_loader.ui.dart';
import 'package:riilfit/src/presentation/global_widgets/pin_fields.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class VerifyPhoneUi extends GetView<VerifyPhoneController> {
  const VerifyPhoneUi({super.key});

  @override
  VerifyPhoneController get controller => Get.put(VerifyPhoneController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.viewState.isBusy) {
          return const NetworkLoaderUi(
            message: 'Hold on, verifying otp...',
          );
        }
        return GestureDetector(
          onTap: () {
            final currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: const AuthAppbarUi(),
            body: SafeArea(
              child: Padding(
                padding: baseViewPadding,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Gap(12),
                                const TextUi.heading3(
                                  'Phone Verification',
                                ),
                                const Gap(24),
                                const TextUi.bodyMed(
                                  'Enter the 6-digit security code sent to',
                                  textAlign: TextAlign.center,
                                ),
                                const Gap(4),
                                TextUi(
                                  controller.phoneNumber.addCountryCode
                                      .obscurePhoneNumber,
                                  textAlign: TextAlign.center,
                                  style: bodyMed.copyWith(
                                    color: primary,
                                    fontWeight: mediumText,
                                  ),
                                ),
                                const Gap(8),
                                InkWell(
                                  onTap: controller.changePhoneNumber,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Obx(
                                      () => TextUi(
                                        'Change phone number',
                                        style: bodySmall.copyWith(
                                          color:
                                              controller.themeService.isDarkMode
                                                  ? grayScale100
                                                  : grayScale700,
                                          fontWeight: mediumText,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(24),
                                PinFieldUi(
                                  controller: controller.pinController,
                                  onChanged: (_) {
                                    controller.enableButton();
                                  },
                                ),
                                const Gap(48),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: controller.resendCode,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Obx(
                                () => TextUi.bodyMed(
                                  'Resend security code',
                                  color: controller.themeService.isDarkMode
                                      ? grayScale100
                                      : grayScale700,
                                  fontWeight: mediumText,
                                ),
                              ),
                            ),
                          ),
                          const Gap(24),
                          Obx(
                            () => PrimaryButtonUi(
                              text: 'Verify code',
                              onPressed: controller.isButtonDisabled.value
                                  ? null
                                  : controller.verifyPhoneNumber,
                            ),
                          ),
                          const Gap(24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
