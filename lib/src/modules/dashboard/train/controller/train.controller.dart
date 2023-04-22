import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/training_levels.enum.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

import '../../../../routing/app_pages.dart';

class TrainController extends BaseController {
  @override
  void onInit() {
    searchController = TextEditingController();
    filteredWorkoutCategories = workoutCategories = <String>[
      'Legs',
      'Abs',
      'Thighs',
      'Back',
      'Chest',
      'Biceps',
      'Shoulders',
      'Neck',
      'Push Ups',
      'Forearms',
    ];
    super.onInit();
  }

  late TextEditingController searchController;

  final trainingLevel = TrainingLevelEnum.beginner.obs;

  void searchTrainings(String? query) {
    if (query == null || query.isEmpty) {
      filteredWorkoutCategories = workoutCategories;
      return;
    }

    // if(query)
  }

  void switchLevels(int index) {
    trainingLevel.value = TrainingLevelEnum.values[index];
  }

  late List<String> filteredWorkoutCategories;

  late List<String> workoutCategories;

  //Navigate to trainers details page
  void openTrainersDetailsPage() {
    navigationService.navigateTo(
      Routes.trainersDetails,
    );
  }

  void openTrainingContentPage() {
    navigationService.navigateTo(
      Routes.trainingContent,
    );
  }
}
