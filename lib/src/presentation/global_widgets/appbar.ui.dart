import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/resources/images.res.dart';

import 'auth_back_button.ui.dart';

class AuthAppbarUi extends GetView implements PreferredSizeWidget {
  const AuthAppbarUi({
    super.key,
    this.actions,
  });

  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64.w,
      leading: const AuthBackButtonUi(),
      actions: actions,
      title: Image.asset(
        riilfitLogoPng,
        height: 28.h,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
