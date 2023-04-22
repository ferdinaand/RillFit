import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';

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
  bool GymOwnerSelect = false;
  bool userSelect = false;
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
                Get.offAndToNamed<void>(
                  Routes.login,
                );
              },
              child: RoleCardUi(
                isSelected: userSelect,
                image: userRole,
                role: 'User',
              ),
            ),
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
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (trainerSelect == false) {
                    GymOwnerSelect = false;
                    trainerSelect = true;
                    userSelect = false;
                    storeSelect = false;
                  } else {
                    trainerSelect = false;
                  }
                });
              },
              child: RoleCardUi(
                isSelected: trainerSelect,
                image: trainerRole,
                role: 'Trainer',
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (storeSelect == false) {
                    storeSelect = true;
                    GymOwnerSelect = false;
                    trainerSelect = false;
                    userSelect = false;
                  } else {
                    storeSelect = false;
                  }
                });
              },
              child: RoleCardUi(
                isSelected: storeSelect,
                image: storeOwnerRole,
                role: 'Store Owner',
              ),
            ),
          ],
        )
      ],
    );
  }
}
