import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_details/controller/gym_details.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class GymDetailsUi extends GetView<GymDetailsController> {
  const GymDetailsUi({super.key});

  @override
  GymDetailsController get controller => Get.put(GymDetailsController());

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
          title: 'GymDetailss',
        ),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (_, __) {
              return [
                SliverAppBar(
                  pinned: true,
                  snap: true,
                  floating: true,
                  expandedHeight: 240.h,
                  flexibleSpace: const FlexibleSpaceBar(
                    title: TextUi.bodyLarge(
                      'GetFit Gym',
                      fontWeight: semiBoldText,
                    ),
                  ),
                ),
              ];
            },
            body: Column(),
          ),
        ),
      ),
    );
  }
}
