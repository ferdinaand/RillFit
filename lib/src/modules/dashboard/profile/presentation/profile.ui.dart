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
      child: controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: primary,
                backgroundColor: Colors.white,
              ),
            )
          : Scaffold(
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
                          controller.themeService.isDarkMode
                              ? sunIcon
                              : moonIcon,
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
                              height: 102,
                              width: 102,
                              decoration: BoxDecoration(
                                color: controller.themeService.isDarkMode
                                    ? grayScale700
                                    : grayScale50,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(16),
                              child: SvgPicture.asset(
                                imagePlaceholder,
                                color: primary20,
                              ),
                            ),
                          ),
                          const Gap(8),
                          TextUi.bodyMed(
                            controller.currentUser.fullName ?? '',
                            fontWeight: mediumText,
                          ),
                          const Gap(4),
                          TextUi.bodySmall(
                            controller.currentUser.phoneNumber ?? '',
                          ),
                          const Gap(24),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            margin: baseViewPadding,
                            decoration: const BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.all(
                                regularRadius,
                              ),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  favoriteIcon,
                                  color: grayScale50,
                                ),
                                const Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text:
                                              'Do you own a gym or sell gym equipments, or are you a gym trainer? ',
                                          style: bodySmall.copyWith(
                                            height: 1.5,
                                            color: grayScale50,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Create a vendor account',
                                              style: bodySmall.copyWith(
                                                fontWeight: semiBoldText,
                                                color: white,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = controller
                                                    .createVendorAccount,
                                            ),
                                            const TextSpan(
                                              text:
                                                  ' now to put yourself on Riilfit and earn!',
                                              style: bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Gap(16),
                          const ProfileTileUi(
                            icon: userIcon,
                            title: 'Edit profile info',
                          ),
                          const ProfileTileUi(
                            icon: gearIcon,
                            title: 'Settings',
                          ),
                          const ProfileTileUi(
                            icon: helpIcon,
                            title: 'Support',
                          ),
                          const ProfileTileUi(
                            icon: aboutIcon,
                            title: 'About Riilfit',
                            tag: VersionNumberCardUi(),
                          ),
                          ProfileTileUi(
                            icon: exitIcon,
                            title: 'Logout',
                            onTap: controller.logout,
                          ),
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
