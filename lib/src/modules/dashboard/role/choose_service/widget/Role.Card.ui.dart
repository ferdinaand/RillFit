import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';

import '../../../../../presentation/resources/icons.res.dart';
import '../../../../../presentation/widgets.dart';

// ignore: must_be_immutable
class RoleCardUi extends StatelessWidget {
  RoleCardUi({
    super.key,
    required this.isSelected,
    required this.role,
    required this.image,
  });
  bool isSelected;
  String image;
  String role;
  @override
  Widget build(BuildContext context) {
    // ignore: use_decorated_box
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Container(
        height: 140.h,
        width: 142.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: isSelected ? primary : white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: isSelected,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        roleTickIcon,
                        height: 15,
                        width: 15,
                      ),
                      const Gap(5)
                    ],
                  ),
                ),
                Image.asset(image),
                const Gap(9),
                TextUi.bodyLarge(
                  role,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
