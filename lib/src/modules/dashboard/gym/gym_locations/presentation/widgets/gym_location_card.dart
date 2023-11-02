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
import '../../../../../../routing/app_pages.dart';

class LocationCard extends StatelessWidget {
  LocationCard(
      {required this.location,
      required this.ontap,
      super.key,
      required this.city});
  String location;
  String city;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
        height: 120.h,
        width: 360.h,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: primary)),
          elevation: 2,
          child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor: primary.withOpacity(0.7),
              // splashColor: primary.withOpacity(0.5),
              onTap: ontap,
              child: Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(locationIcon2),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 29, right: 2),
                              child: TextUi.bodyLarge(
                                location.toUpperCase(),
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              children: [
                                Text('-'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: TextUi.bodyLarge(
                                    city.toUpperCase(),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
        ),
      ),
    );
  }
}
