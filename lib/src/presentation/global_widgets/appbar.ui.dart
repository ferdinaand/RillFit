import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      leadingWidth: 64,
      leading: const AuthBackButtonUi(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
