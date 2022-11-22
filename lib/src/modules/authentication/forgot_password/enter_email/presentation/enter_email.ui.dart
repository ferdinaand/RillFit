import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/forgot_password/enter_email/controller/enter_email.controller.dart';
import 'package:riilfit/src/modules/authentication/forgot_password/enter_email/presentation/widgets/enter_email_form.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/themes/app.themes.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class ForgotPasswordEnterEmailUi
    extends GetView<ForgotPasswordEnterEmailController> {
  const ForgotPasswordEnterEmailUi({super.key});

  @override
  ForgotPasswordEnterEmailController get controller =>
      Get.put(ForgotPasswordEnterEmailController());

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
                          children: const [
                            TextUi.heading3(
                              'Forgot Password',
                            ),
                            Gap(16),
                            TextUi.bodyMed(
                              "Enter your email and we'll send you instructions on how to reset your password.",
                              textAlign: TextAlign.center,
                            ),
                            Gap(24),
                            ForgotPasswordEnterEmailFormUi(),
                            Gap(48),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: controller.navigateToLoginPage,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Obx(
                            () => TextUi.bodyMed(
                              'Sign in instead',
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
                          text: 'Send recovery pin',
                          onPressed: controller.isButtonDisabled.value
                              ? null
                              : controller.sendOtpToEmail,
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
