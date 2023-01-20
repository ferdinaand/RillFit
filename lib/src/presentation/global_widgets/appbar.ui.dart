import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/presentation/resources/images.res.dart';
import 'package:riilfit/src/presentation/resources/weights.res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class AuthAppbarUi extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppbarUi({
    super.key,
    this.actions,
  });

  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64,
      leading: const AuthBackButtonUi(),
      actions: actions,
      centerTitle: true,
      title: Image.asset(
        riilfitLogoPng,
        height: 28.h,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MainAppbarUi extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbarUi({
    super.key,
    this.actions,
    required this.title,
    this.showBackButton = true,
    this.backgroundColor,
    this.iconColor,
    this.iconBackgroundColor,
  });

  final List<Widget>? actions;
  final String title;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 64,
      leading: showBackButton
          ? AuthBackButtonUi(
              iconColor: iconColor,
              backgroundColor: iconBackgroundColor,
            )
          : const SizedBox.shrink(),
      actions: actions,
      centerTitle: true,
      title: TextUi.bodyLarge(
        title,
        fontWeight: semiBoldText,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
