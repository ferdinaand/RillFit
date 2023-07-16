import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/training_levels.enum.dart';
import 'package:riilfit/src/modules/dashboard/train/controller/train.controller.dart';
import 'package:riilfit/src/modules/dashboard/train/presentation/widgets/Training.Tab.View.dart';
import 'package:riilfit/src/modules/dashboard/train/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/modules/dashboard/train/presentation/widgets/training_content_card.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class TrainUi extends GetView<TrainController> {
  const TrainUi({super.key});

  @override
  TrainController get controller => Get.put(TrainController());

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
          title: 'Workout',
        ),
        body: SafeArea(
          child: CustomScrollView(
            physics: const ScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Gap(16),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: const TrainSearchFieldUi(),
                    ),
                    const TrainingTabBar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
