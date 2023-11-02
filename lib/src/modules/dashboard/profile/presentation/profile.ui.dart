import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/profile/controller/profile.controller.dart';
import 'package:riilfit/src/modules/dashboard/profile/presentation/widgets/profile_menu_item.ui.dart';
import 'package:riilfit/src/modules/dashboard/profile/presentation/widgets/version_number_card.ui.dart';
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
      child:
          // controller.isLoading.value
          //     ? const Center(
          //         child: CircularProgressIndicator(
          //           color: primary,
          //           backgroundColor: Colors.white,
          //         ),
          //       )
          //     :
          Scaffold(
        appBar: MainAppbarUi(
          title: 'Profile',
          showBackButton: false,
          actions: [
            GestureDetector(
              onTap: controller.themeService.changeThemeMode,
              child: Obx(
                () => AnimatedContainer(
                  duration: fastDuration,
                  decoration: BoxDecoration(
                    color: controller.themeService.isDarkMode
                        ? grayScale700
                        : grayScale50,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 12),
                  child: SvgPicture.asset(
                    controller.themeService.isDarkMode ? sunIcon : moonIcon,
                    color: primary20,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Gap(16),
                    Obx(
                      () => Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: controller.themeService.isDarkMode
                              ? grayScale700
                              : grayScale50,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          userIcon,
                          color: primary20,
                        ),
                      ),
                    ),
                    const Gap(8),
                    Obx(
                      () => TextUi.bodyLarge(
                        controller.fullname.value,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(4),
                    Obx(
                      () => TextUi.bodyMed(
                        fontWeight: FontWeight.w400,
                        controller.phoneNumber.value,
                      ),
                    ),
                    const Gap(24),
                    const Gap(16),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                                color: controller.themeService.isDarkMode
                                    ? grayScale700
                                    : grayScale100,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const ProfileTileUi(
                                    menuIconColor: primary,
                                    icon: userIcon,
                                    title: 'Edit profile info',
                                  ),
                                  const ProfileTileUi(
                                    menuIconColor: grayScale900,
                                    icon: gearIcon,
                                    title: 'Settings',
                                  ),
                                  const ProfileTileUi(
                                    menuIconColor: Colors.blue,
                                    icon: helpIcon,
                                    title: 'Support',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Gap(20),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                                color: controller.themeService.isDarkMode
                                    ? grayScale700
                                    : grayScale100,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const ProfileTileUi(
                                    menuIconColor: primary,
                                    icon: aboutIcon,
                                    title: 'About Riilfit',
                                    tag: VersionNumberCardUi(),
                                  ),
                                  ProfileTileUi(
                                    menuIconColor: primary,
                                    icon: exitIcon,
                                    title: 'Logout',
                                    onTap: controller.logout,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const Gap(48),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
