import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/modules/authentication/login/controller/login.controller.dart';
import 'package:riilfit/src/modules/authentication/login/presentation/widgets/login_form.ui.dart';
import 'package:riilfit/src/presentation/global_widgets/network_loader.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class LoginUi extends GetView<LoginController> {
  const LoginUi({super.key});

  @override
  LoginController get controller => Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.viewState.isBusy) {
          return const NetworkLoaderUi(
            message: 'Hold on, signing you in...',
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
                                  'Sign In',
                                ),
                                const Gap(24),
                                const LoginFormUi(),
                                const Gap(24),
                                Obx(
                                  () => PrimaryButtonUi(
                                    text: 'Sign In',
                                    loading: controller.viewState.isBusy,
                                    onPressed: controller.isButtonDisabled.value
                                        ? null
                                        : controller.login,
                                  ),
                                ),
                                const Gap(12),
                                InkWell(
                                  onTap: controller.navigateToForgotPassword,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    child: Obx(
                                      () => TextUi.bodyMed(
                                        'Forgot password?',
                                        color:
                                            controller.themeService.isDarkMode
                                                ? grayScale100
                                                : grayScale700,
                                        fontWeight: mediumText,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(24),
                              ],
                            ),
                          ),
                          const TextUi.bodyMed(
                            'Alternatively, Sign in with',
                          ),
                          const Gap(24),
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
                                "Don't have an account? ",
                              ),
                              GestureDetector(
                                onTap: controller.navigateToRegisterPage,
                                child: const TextUi.bodyMed(
                                  'Sign up',
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
      },
    );
  }
}
