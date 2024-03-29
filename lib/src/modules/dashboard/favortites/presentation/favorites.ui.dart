import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/favortites/presentation/widgets/favoritesTabView.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class FavoritesUi extends GetView<GymController> {
  const FavoritesUi({super.key});

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
          showBackButton: false,
          title: 'Favourites',
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
                const FavoriteTabBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
