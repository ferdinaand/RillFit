import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';

class newMemberContainer extends StatelessWidget {
  const newMemberContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89.h,
      width: 298.w,
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: white, width: 2),
                        image: DecorationImage(image: AssetImage(newMember3)),
                        shape: BoxShape.circle),
                  ),
                  Positioned(
                    left: 35,
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: white, width: 2),
                          image: DecorationImage(image: AssetImage(newMember2)),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    left: 70,
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: white, width: 2),
                          image: DecorationImage(image: AssetImage(newMember1)),
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
            TextUi.bodyMed(
              'onboarded\nMembers',
              color: white,
            )
          ],
        ),
      ),
    );
  }
}
