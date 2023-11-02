import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../presentation/resources/colors.res.dart';
import '../../../../../../presentation/widgets.dart';

class cardUi extends StatelessWidget {
  const cardUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 187.h,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.60),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
          bottom: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/png/cardChip.png'),
                Image.asset('assets/png/cardType.png')
              ],
            ),
            Gap(30),
            Row(
              children: [
                TextUi.heading4(
                  '**** **** **** **89',
                  color: white,
                )
              ],
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUi.bodyMed('Ferdinand Ekpo', color: white),
                TextUi.bodyLarge('08/23', color: white)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
