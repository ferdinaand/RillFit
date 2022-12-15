import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/profile/controller/profile.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class ProfileUi extends GetView<ProfileController> {
  const ProfileUi({super.key});

  @override
  ProfileController get controller => Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: MainAppbarUi(
          title: 'Profile',
          showBackButton: false,
          actions: [
            IconButton(
              onPressed: controller.themeService.changeThemeMode,
              icon: SvgPicture.asset(
                sunIcon,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: baseViewPadding,
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: const [
                      Gap(16),
                      Gap(48),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
