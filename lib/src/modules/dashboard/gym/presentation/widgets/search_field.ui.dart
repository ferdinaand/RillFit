import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/controller/gym.controller.dart';
import 'package:riilfit/src/presentation/resources/icons.res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class GymSearchFieldUi extends GetView<GymController> {
  const GymSearchFieldUi({
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
