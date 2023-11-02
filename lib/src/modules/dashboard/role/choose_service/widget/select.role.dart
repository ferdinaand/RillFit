import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/utils/config.dart';

import '../../../../../presentation/resources/images.res.dart';
import '../../../../../presentation/widgets.dart';
import '../../../../../routing/app_pages.dart';
import '../../controller/role.controller.dart';
import 'Role.Card.ui.dart';

class SelectRoleUi extends StatefulWidget {
  const SelectRoleUi({super.key});

  @override
  State<SelectRoleUi> createState() => _SelectRoleUiState();
}

class _SelectRoleUiState extends State<SelectRoleUi> {
  bool button1Selected = false;
  bool button2Selected = false;

  void toggleButton1() {
    setState(
      () {
        button1Selected = !button1Selected;
        button2Selected = false; // Ensure only one button is selected
      },
    );
  }

  void toggleButton2() {
    setState(
      () {
        button2Selected = !button2Selected;
        button1Selected = false; // Ensure only one button is selected
      },
    );
  }

  RoleController get controller => Get.put(RoleController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                String user = 'user';
                controller.selectuser(user);
                toggleButton1();
              },
              child: RoleCardUi(
                isSelected: button1Selected,
                image: userRole,
                role: 'User',
              ),
            ),
            const Gap(2),
            GestureDetector(
              onTap: () {
                String user = 'gym_owner';
                controller.selectuser(user);
                toggleButton2();
              },
              child: RoleCardUi(
                isSelected: button2Selected,
                image: gymOwnerRole,
                role: 'Gym Owner',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
