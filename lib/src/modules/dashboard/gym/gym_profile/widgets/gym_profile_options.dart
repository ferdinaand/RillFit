// ignore_for_file: prefer_const_constructors, use_named_constants

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/member_services.dummy.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../domain/services/themes.services.dart';

class GymOptionCard extends StatelessWidget {
  GymOptionCard({
    required this.title,
    required this.iconPath,
    required this.description,
    required this.onTap,
    super.key,
  });
  bool isSelected = false;
  String title = '';
  String iconPath = '';
  String description = '';
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 108,
          width: 350,
          margin: const EdgeInsets.only(
            bottom: 0,
          ).r,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFFF4F4F4) : Color(0xFF031E22),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(iconPath, color: white
                            //  Get.find<ThemeService>().isDarkMode
                            //     ? grayScale100
                            //     : grayScale900,
                            ),
                        Gap(10),
                        TextUi.bodyXL(
                          title,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: white,
                        ),
                      ],
                    ),
                    TextUi.bodyXL(
                      description,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: white,
                    ),
                  ],
                ),
                Image.asset(arrowRight, color: white
                    //  Get.find<ThemeService>().isDarkMode
                    //     ? grayScale100
                    //     : grayScale900,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
