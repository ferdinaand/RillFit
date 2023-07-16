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
      child: SizedBox(
        height: 75.h,
        width: 360.h,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(locationIcon2),
                    Padding(
                      padding: const EdgeInsets.only(left: 29),
                      child: TextUi.bodyLarge(
                        location.toUpperCase(),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Image.asset(
                    arrowRight,
                    color: Get.find<ThemeService>().isDarkMode
                        ? grayScale100
                        : grayScale900,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
