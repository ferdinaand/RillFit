import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/register/controller/register.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import 'widgets/register_form.ui.dart';

class RegisterUi extends GetView<RegisterController> {
  const RegisterUi();

  @override
  RegisterController get controller => Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
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
                            const TextUi.heading2(
                              "Sign Up",
                            ),
                            const Gap(24),
                            const RegisterFormUi(),
                            const Gap(24),
                            Obx(
                              () => PrimaryButtonUi(
                                text: "Sign up",
                                onPressed: controller.isButtonDisabled.value
                                    ? null
                                    : controller.signUp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const TextUi.bodyMed(
                        "Alternatively, Sign up with",
                      ),
                      const Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AssetIconButton(
                            icon: fbIcon,
                            size: 32,
                            onTap: controller.loginViaFacebook,
                          ),
                          const Gap(24),
                          AssetIconButton(
                            icon: googleIcon,
                            size: 32,
                            onTap: controller.loginViaGoogle,
                          ),
                        ],
                      ),
                      const Gap(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextUi.bodyMed(
                            "Already have an account? ",
                          ),
                          GestureDetector(
                            onTap: controller.navigateToLoginPage,
                            child: const TextUi.bodyMed(
                              "Sign in",
                              color: primary,
                              fontWeight: semiBoldText,
                            ),
                          ),
                        ],
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
