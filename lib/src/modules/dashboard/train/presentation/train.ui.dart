import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/training_levels.enum.dart';
import 'package:riilfit/src/modules/dashboard/train/controller/train.controller.dart';
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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: MainAppbarUi(
            title: 'Train',
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kTextTabBarHeight),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 0.4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: grayScale700,
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                  TabBar(
                    indicatorColor: primary,
                    // labelColor: dark,
                    labelStyle: bodyMed.copyWith(
                      fontWeight: semiBoldText,
                    ),
                    unselectedLabelStyle: bodyMed.copyWith(),

                    tabs: TrainingLevelEnum.values
                        .map(
                          (level) => Tab(
                            icon: Text(
                              level.name.capitalizeFirst!,
                            ),
                          ),
                        )
                        .toList(),
                    onTap: controller.switchLevels,
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(16),
                      Padding(
                        padding: baseViewPadding,
                        child: const TrainSearchFieldUi(),
                      ),
                      const Gap(16),
                      ...controller.filteredWorkoutCategories
                          .asMap()
                          .entries
                          .map(
                        (workoutName) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: baseViewPadding,
                                child: TextUi.bodyMed(
                                  workoutName.value,
                                  fontWeight: mediumText,
                                ),
                              ),
                              const Gap(8),
                              SizedBox(
                                height: 120.h,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: baseViewPadding,
                                  separatorBuilder: (_, __) => const Gap(8),
                                  itemCount: 6,
                                  itemBuilder: (_, i) {
                                    return TrainingContentCardUi(
                                      workoutName: workoutName.value,
                                    );
                                  },
                                ),
                              ),
                              const Gap(16),
                            ],
                          );
                        },
                      ),
                      const Gap(32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
