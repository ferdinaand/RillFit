import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/member_services.dummy.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class GymUi extends GetView<GymController> {
  const GymUi({
    super.key,
  });

  @override
  GymController get controller => Get.put(GymController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const MainAppbarUi(
          title: 'Gyms',
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(16),
                Padding(
                  padding: baseViewPadding,
                  child: const GymSearchFieldUi(),
                ),
                const Gap(16),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        ...gServices.asMap().entries.map(
                          (entry) {
                            final service = entry.value;
                            return GymCardUi(
                              service: service,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
