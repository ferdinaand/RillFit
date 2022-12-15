import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/train/controller/home.controller.dart';
import 'package:riilfit/src/presentation/resources/icons.res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class TrainSearchFieldUi extends GetView<TrainController> {
  const TrainSearchFieldUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldUi(
      controller: controller.searchController,
      hintText: 'Search for gyms near you',
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          searchIcon,
        ),
      ),
    );
  }
}
