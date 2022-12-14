import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/modules/authentication/register/controller/register.controller.dart';
import 'package:riilfit/src/modules/authentication/register/presentation/widgets/register_form.ui.dart';
import 'package:riilfit/src/presentation/global_widgets/network_loader.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class RegisterUi extends GetView<RegisterController> {
  const RegisterUi({super.key});

  @override
  RegisterController get controller => Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.viewState.isBusy) {
          return const NetworkLoaderUi(
            message: 'Hold on, creating your account...',
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
                                  'Sign Up',
                                ),
                                const Gap(24),
                                const RegisterFormUi(),
                                const Gap(24),
                                Obx(
                                  () => PrimaryButtonUi(
                                    text: 'Sign up',
                                    loading: controller.viewState.isBusy,
                                    onPressed: controller.isButtonDisabled.value
                                        ? null
                                        : controller.signUp,
                                  ),
                                ),
                                const Gap(24),
                              ],
                            ),
                          ),
                          const TextUi.bodyMed(
                            'Alternatively, Sign up with',
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
                                'Already have an account? ',
                              ),
                              GestureDetector(
                                onTap: controller.navigateToLoginPage,
                                child: const TextUi.bodyMed(
                                  'Sign in',
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
