import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/utils/config.dart';

import '../../../../../presentation/resources/images.res.dart';
import '../../../../../presentation/widgets.dart';
import '../../../../../routing/app_pages.dart';
import '../widget/select.role.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 37, right: 37, top: 39),
        child: Column(
          children: [
            Image.asset(
              riilfitLogoPng,
              height: 28.h,
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
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
            Gap(58),
            const SelectRoleUi(),
            const Gap(300),
            PrimaryButtonUi(
              text: 'Continue',
              onPressed: () {
                if (userSelect == true) {
                  Get.offAndToNamed<void>(
                    Routes.login,
                  );
                } else {
                  Get.offAndToNamed<void>(
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
