// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/modules/authentication/login/controller/login.controller.dart';
import 'package:riilfit/src/modules/authentication/register/presentation/widgets/Gym_Owner_Registration_form_ui.dart';
import 'package:riilfit/src/modules/authentication/login/presentation/widgets/login_form.ui.dart';
import 'package:riilfit/src/presentation/global_widgets/network_loader.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../controller/Gym_Owner_Register_controller.dart';

class GymOwnerRegistrationUi extends GetView<GymOwnerRegisterController> {
  const GymOwnerRegistrationUi({super.key});

  @override
  GymOwnerRegisterController get controller =>
      Get.put(GymOwnerRegisterController());

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Gap(50),
                          TextUi.bodyLarge(
                            'Gym Owner',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                          Gap(17),
                          TextUi.bodyLarge(
                            'Enter Information about your gym below',
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                          Gap(48),
                          GymOwnerRegistrationFormUi(),
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
