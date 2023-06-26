import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/stores/controller/stores.controller.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/widgets/Store.tab.view.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

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
        appBar: const MainAppbarUi(
          title: 'Stores',
        ),
        body: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
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
