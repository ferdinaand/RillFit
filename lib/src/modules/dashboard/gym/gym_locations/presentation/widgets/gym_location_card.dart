import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../../domain/services/themes.services.dart';
import '../../../../../../presentation/resources/icons.res.dart';

class LocationCard extends StatelessWidget {
  LocationCard({required this.location, super.key});
  String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        height: 71.h,
        width: 360.h,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Gap(22),
            Image.asset(locationIcon2),
            Gap(29),
            TextUi.bodyLarge(location),
            Gap(157),
            Image.asset(
              arrowRight,
              color: Get.find<ThemeService>().isDarkMode
                  ? grayScale100
                  : grayScale900,
            )
          ],
        ),
      ),
    );
  }
}
