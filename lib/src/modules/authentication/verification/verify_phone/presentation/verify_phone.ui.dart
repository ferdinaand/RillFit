import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/verification/verify_phone/controller/verify_phone.controller.dart';
import 'package:riilfit/src/presentation/global_widgets/pin_fields.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/themes/app.themes.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class VerifyPhoneUi extends GetView<VerifyPhoneController> {
  const VerifyPhoneUi({super.key});

  @override
  VerifyPhoneController get controller => Get.put(VerifyPhoneController());

  @override
  Widget build(BuildContext context) {
    final phoneNumber = Get.arguments as String? ?? '';
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
                            const TextUi.heading3(
                              'Phone Verification',
                            ),
                            const Gap(24),
                            const TextUi.bodyMed(
                              'Enter the 6-digit security code sent to',
                              textAlign: TextAlign.center,
                            ),
                            const Gap(4),
                            TextUi.bodyMed(
                              phoneNumber,
                              textAlign: TextAlign.center,
                              color: primary,
                              fontWeight: mediumText,
                            ),
                            const Gap(24),
                            InkWell(
                              onTap: controller.changePhoneNumber,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Obx(
                                  () => TextUi.bodyMed(
                                    'Change phone number',
                                    color: AppThemes.isDarkMode
                                        ? grayScale100
                                        : grayScale700,
                                    fontWeight: mediumText,
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
                              'Resend recovery code',
                              color: AppThemes.isDarkMode
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
  }
}
