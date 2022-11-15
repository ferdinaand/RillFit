import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/login/controller/login.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import 'widgets/login_form.ui.dart';

class LoginUi extends GetView<LoginController> {
  const LoginUi();

  @override
  LoginController get controller => Get.put(LoginController());

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
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Gap(32),
                    const TextUi.heading2(
                      "Sign In",
                    ),
                    const Gap(36),
                    const LoginFormUi(),
                    const Gap(12),
                    InkWell(
                      onTap: controller.navigateToForgotPassword,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: TextUi.bodyMed(
                          "Forgot password?",
                          color: grayScale700,
                          fontWeight: semiBoldText,
                        ),
                      ),
                    ),
                    const Gap(52),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => PrimaryButtonUi(
                          text: "Sign In",
                          onPressed: controller.isButtonDisabled.value
                              ? null
                              : controller.login,
                        ),
                      ),
                      const Gap(24),
                      const TextUi.bodyXL(
                        "Sign in with",
                      ),
                      const Gap(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextUi.bodyMed(
                            "Don't have an account? ",
                          ),
                          GestureDetector(
                            onTap: controller.navigateToRegisterPage,
                            child: const TextUi.bodyMed(
                              "Sign up",
                              color: primary,
                              fontWeight: semiBoldText,
                            ),
                          ),
                        ],
                      ),
                      const Gap(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextUi.bodyMed(
                            "Don't have an account? ",
                          ),
                          GestureDetector(
                            onTap: controller.navigateToRegisterPage,
                            child: const TextUi.bodyMed(
                              "Sign up",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
