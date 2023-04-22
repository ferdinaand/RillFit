import 'package:flutter/material.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/modules/dashboard/train/presentation/widgets/Trainers.card.ui.dart';
import 'package:riilfit/src/modules/dashboard/train/presentation/widgets/workout.category.ui.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';

import '../../../../../presentation/global_widgets/gap.ui.dart';
import '../../../../../presentation/resources/res.dart';
import '../../../gym/gyms_list/presentation/widgets/gym_card.ui.dart';
import 'Training.card.ui.dart';

class TrainingTabBar extends StatefulWidget {
  const TrainingTabBar({super.key});

  @override
  State<TrainingTabBar> createState() => _TrainingTabBarState();
}

class _TrainingTabBarState extends State<TrainingTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _TrainTabController;
  @override
  void initState() {
    _TrainTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _TrainTabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: _TrainTabController,
                indicatorColor: primary,
                // labelColor: dark,
                isScrollable: true,
                indicatorWeight: 5,
                indicatorPadding: const EdgeInsets.only(left: 34, right: 34),
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelStyle: bodyMed.copyWith(
                  fontWeight: semiBoldText,
                ),
                unselectedLabelStyle: bodyMed.copyWith(),
                tabs: [
                  Row(
                    children: const [
                      TextUi.heading4(
                        'Browse',
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      TextUi.heading4(
                        'Trainers',
                        fontSize: 16,
                      ),
                    ],
                  )
                ]),
          ),
        ),
        const Gap(40),
        Container(
          height: 500,
          child: TabBarView(
            controller: _TrainTabController,
            children: [
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Row(
                            children: [
                              TextUi.heading4(
                                'Top Workouts',
                                color: themeService.isDarkMode
                                    ? Colors.white
                                    : grayScale900.withOpacity(.5),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    TrainingCardUi(),
                                    Gap(30),
                                    TrainingCardUi(),
                                    Gap(30),
                                    TrainingCardUi(),
                                    Gap(30),
                                    TrainingCardUi(),
                                    Gap(30),
                                    TrainingCardUi(),
                                    Gap(30),
                                    TrainingCardUi(),
                                  ],
                                ),
                              ),
                              const Gap(0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, bottom: 0),
                                child: Row(
                                  children: [
                                    TextUi.heading4(
                                      'Category',
                                      color: themeService.isDarkMode
                                          ? Colors.white
                                          : grayScale900.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(16),
                              const WorkoutCategoryCardUi(
                                Image: 'assets/png/Rectangle169.png',
                                Text: 'Muscle Group',
                              ),
                              const Gap(20),
                              const WorkoutCategoryCardUi(
                                Image: 'assets/png/Rectangle173.png',
                                Text: 'Workout Force',
                              ),
                              const Gap(20),
                              const WorkoutCategoryCardUi(
                                Image: 'assets/png/Rectangle174.png',
                                Text: 'Equipment',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TrainersCardUi(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
