import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/global_widgets/gap.ui.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//USER CONTAINER
class dashContainer extends StatelessWidget {
  const dashContainer({
    super.key,
    required this.iconPath,
    required this.height,
    required this.width,
    required this.Amount,
    required this.percent,
  });

  final String iconPath;
  final double width;
  final double height;
  final String Amount;
  final String percent;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [primary, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
          padding: const EdgeInsets.only(left: 0, top: 0, right: 0),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    TextUi.bodyMed(
                      'Balance',
                      color: white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextUi.heading1(
                      Amount,
                      color: white,
                    ),
                  ],
                ),
                Gap(50),
                Row(
                  children: [
                    TextUi.bodyMed(
                      'Daily Growth',
                      color: white,
                    ),
                  ],
                ),
                Gap(0),
                Row(
                  children: [
                    TextUi.heading2(
                      percent,
                      color: white,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
