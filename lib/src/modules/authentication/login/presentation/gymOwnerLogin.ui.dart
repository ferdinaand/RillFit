// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/modules/authentication/login/controller/login.controller.dart';
import 'package:riilfit/src/modules/authentication/login/presentation/widgets/gymOnwerLoginForm.ui.dart';
import 'package:riilfit/src/modules/authentication/login/presentation/widgets/login_form.ui.dart';
import 'package:riilfit/src/modules/authentication/register/controller/Gym_Owner_Register_controller.dart';
import 'package:riilfit/src/presentation/global_widgets/network_loader.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../controller/gymOwnerLogin.controller.dart';

class GymOwnerLoginUi extends GetView<GymOwnerLoginController> {
  const GymOwnerLoginUi({super.key});

  @override
  GymOwnerLoginController get controller => Get.put(GymOwnerLoginController());

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
                                const GymOwnerLoginFormUi(),
                                const Gap(24),
                                Obx(
                                  () {
                                    return controller.isLoading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: primary,
                                            ),
                                          )
                                        : PrimaryButtonUi(
                                            text: 'Sign In',
                                            loading: controller.isLoading.value,
                                            onPressed: controller
                                                    .isButtonDisabled.value
                                                ? null
                                                : controller.login,
                                          );
                                  },
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
                                        'Sign up',
                                        color: primary,
                                        fontWeight: semiBoldText,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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

Future showDialogBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return (Center(
        child:
            //     CupertinoActivityIndicator(

            //   animating: true,
            //   color: Colors.blue,
            // )

            CircularProgressIndicator(
          backgroundColor: Color.fromARGB(126, 6, 6, 6),
          color: Color.fromARGB(255, 33, 117, 243),
        ),
      ));
    },
  );
}
