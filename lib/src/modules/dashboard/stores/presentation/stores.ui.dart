import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/stores/controller/stores.controller.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/widgets/Store.tab.view.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/widgets/cartbutton.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class StoresUi extends GetView<StoresController> {
  const StoresUi({super.key});

  @override
  StoresController get controller => Get.put(StoresController());

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
        appBar: MainAppbarUi(
          title: 'Shop',
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: cartButton(
                ontap: () {
                  Get.toNamed(Routes.storeCart);
                },
              ),
            ),
            Gap(25)
          ],
        ),
        body: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 20,
                ),
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: const [
                      Gap(16),
                      StoresSearchFieldUi(),
                      Gap(29),
                      StoreTabBar(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
