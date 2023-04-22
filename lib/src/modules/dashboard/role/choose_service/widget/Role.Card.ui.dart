import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';

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
        height: 124.h,
        width: 134.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: isSelected ? primary : white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                const Gap(9),
                TextUi.bodyLarge(
                  role,
                  fontSize: 14,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
