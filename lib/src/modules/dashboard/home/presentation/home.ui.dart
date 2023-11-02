import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/member_services.dummy.dart';
import 'package:riilfit/src/modules/dashboard/home/controller/home.controller.dart';
import 'package:riilfit/src/modules/dashboard/home/presentation/widgets/header.ui.dart';
import 'package:riilfit/src/modules/dashboard/home/presentation/widgets/member_service_tile.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class HomeUi extends GetView<HomeController> {
  const HomeUi({super.key});

  @override
  HomeController get controller => Get.put(HomeController());

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
        body: SafeArea(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: baseViewPadding,
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Gap(16),
                      HomeHeaderUi(),
                      const Gap(48),
                      Column(
                        children: [
                          ...memberServices.asMap().entries.map((entry) {
                            final service = entry.value;
                            return ServicesTileUi(
                              service,
                            );
                          }),
                        ],
                      ),
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
