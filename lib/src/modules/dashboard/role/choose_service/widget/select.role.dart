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
  bool storeSelect = false;
  bool trainerSelect = false;
  RoleController get controller => Get.put(RoleController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (userSelect == false) {
                    userSelect = true;
                    GymOwnerSelect = false;
                    trainerSelect = false;
                    storeSelect = false;
                  } else {
                    userSelect = false;
                  }
                });
              },
              child: RoleCardUi(
                isSelected: userSelect,
                image: userRole,
                role: 'User',
              ),
            ),
            const Gap(5),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (GymOwnerSelect == false) {
                    GymOwnerSelect = true;
                    trainerSelect = false;
                    userSelect = false;
                    storeSelect = false;
                  } else {
                    GymOwnerSelect = false;
                  }
                });
              },
              child: RoleCardUi(
                isSelected: GymOwnerSelect,
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
