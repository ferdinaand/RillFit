import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class GymCardUi extends StatelessWidget {
  const GymCardUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                smallRadius,
              ),
              image: DecorationImage(
                image: AssetImage(
                  servicesImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                smallRadius,
              ),
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 1.0],
                colors: [
                  Colors.black12,
                  Colors.black,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 24,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: grayScale50.withOpacity(.5),
                      borderRadius: const BorderRadius.all(
                        xsmallRadius,
                      ),
                    ),
                    child: const TextUi.bodyMed(
                      'OPEN',
                      color: grayScale900,
                      fontWeight: semiBoldText,
                      height: 16 / 14,
                    ),
                  ),
                ),
                const Spacer(),
                const TextUi.bodySmall(
                  'Lekki, Lagos',
                  color: grayScale50,
                ),
                const TextUi.heading4(
                  'GetFit Gym',
                  color: grayScale50,
                ),
                const Gap(4),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14.w,
                      color: grayScale50,
                    ),
                    const Gap(4),
                    const TextUi.bodySmall(
                      'Weekdays only',
                      height: 14 / 12,
                      color: grayScale50,
                    ),
                    const Gap(4),
                    const TextUi.bodyMed(
                      '\u2022',
                      height: 1,
                      fontWeight: boldText,
                      color: grayScale50,
                    ),
                    const Gap(4),
                    SvgPicture.asset(
                      locatioAltIcon,
                      width: 14.w,
                      height: 14.w,
                      color: grayScale50,
                    ),
                    const Gap(4),
                    const TextUi.bodySmall(
                      '12.4 km',
                      color: grayScale50,
                      height: 14 / 12,
                    ),
                    const Gap(4),
                  ],
                ),
                const Gap(4),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: starColor,
                    ),
                    Icon(
                      Icons.star,
                      color: starColor,
                    ),
                    Icon(
                      Icons.star,
                      color: starColor,
                    ),
                    Icon(
                      Icons.star_half,
                      color: starColor,
                    ),
                    Icon(
                      Icons.star,
                      color: grayScale500,
                    ),
                    Spacer(),
                    Icon(
                      Icons.favorite_border_rounded,
                      color: grayScale100,
                      size: 28,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
