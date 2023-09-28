import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/utils/config.dart';

import '../../../../../presentation/resources/images.res.dart';
import '../../../../../presentation/widgets.dart';
import '../../../../../routing/app_pages.dart';
import '../../controller/role.controller.dart';
import '../widget/select.role.dart';

class ChooseRole extends GetView<RoleController> {
  const ChooseRole({super.key});

  @override
  RoleController get controller => Get.put(RoleController());

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 39),
        child: Column(
          children: [
            Image.asset(
              riilfitLogoPng,
              height: 32.h,
            ),
            const Gap(50),
            Row(
              children: const [
                TextUi.heading4('Choose A Role'),
              ],
            ),
            const Gap(17),
            Row(
              children: const [
                TextUi.bodyMed(
                  'select who you want to be registered as',
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Gap(58),
            const SelectRoleUi(),
            const Gap(260),
            PrimaryButtonUi(
              text: 'Continue',
              onPressed: () {
                if (userSelect == true && ChooseRoleRoute == true) {
                  Get.offAndToNamed<void>(
                    Routes.app,
                  );
                } else if (userSelect == false && ChooseRoleRoute == true) {
                  Get.toNamed<void>(
                    Routes.gymOwnerLogin,
                  );
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
