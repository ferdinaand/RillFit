import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/presentation/global_widgets/auth_back_button.ui.dart';
import 'package:riilfit/src/presentation/resources/images.res.dart';
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

class MainAppbarUi extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbarUi({
    super.key,
    this.actions,
    required this.title,
    this.showBackButton = true,
  });

  final List<Widget>? actions;
  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64.w,
      leading:
          showBackButton ? const AuthBackButtonUi() : const SizedBox.shrink(),
      actions: actions,
      centerTitle: true,
      title: TextUi.bodyLarge(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
