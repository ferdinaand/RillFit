import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/GymOwnerDashboard/home/controller/gymOwnerHomeController.dart';
import 'package:riilfit/src/modules/GymOwnerDashboard/home/presentation/widgets/dashboard%20.container.dart';
import 'package:riilfit/src/modules/GymOwnerDashboard/home/presentation/widgets/members_count.dart';
import 'package:riilfit/src/presentation/global_widgets/gap.ui.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/presentation/resources/icons.res.dart';
import 'package:riilfit/src/presentation/resources/images.res.dart';

class GymOwnerHome extends GetView<GymHomeController> {
  const GymOwnerHome({super.key});

  @override
  GymHomeController get controller => Get.put(GymHomeController());

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 39),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      riilfitLogoPng,
                      height: 32.h,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.logout();
                          },
                          child: Icon(
                            Icons.logout,
                            color: controller.themeService.isDarkMode
                                ? grayScale500
                                : Colors.black,
                            size: 30,
                          ),
                        ),
                        const Gap(3),
                        TextUi.bodyMed('sign out'),
                      ],
                    )
                  ],
                ),
                const Gap(50),
                Row(
                  children: [
                    SizedBox(
                      height: 70.h,
                      width: 70.w,
                      child: CircleAvatar(
                        backgroundColor: controller.themeService.isDarkMode
                            ? grayScale700
                            : Colors.black,
                        child: SvgPicture.asset(userActiveIcon),
                      ),
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => TextUi.bodyLarge(
                            '${controller.fullName}',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Obx(
                          () => TextUi.bodyLarge(
                            '${controller.gymName}',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Gap(40),
                const Row(
                  children: [
                    TextUi.heading1(
                      'Dashboard',
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                const Gap(1),
                const Row(
                  children: [
                    TextUi.bodyLarge(
                      'Your daily updates...',
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const dashContainer(
                      iconPath: backIcon,
                      height: 300,
                      width: 190,
                      Amount: '178,500k',
                      percent: '%7.6',
                    ),
                    // const Gap(70),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 70.h,
                              width: 70.w,
                              child: GestureDetector(
                                onTap: controller.navigateToViewPlans,
                                child: CircleAvatar(
                                  backgroundColor:
                                      controller.themeService.isDarkMode
                                          ? grayScale700
                                          : Colors.black,
                                  child: Image.asset(
                                    emojiHappyIcon,
                                    color: controller.themeService.isDarkMode
                                        ? Colors.black
                                        : white,
                                  ),
                                ),
                              ),
                            ),
                            const TextUi.bodyMed('View Plans'),
                          ],
                        ),
                        const Gap(15),
                        Column(
                          children: [
                            SizedBox(
                              height: 70.h,
                              width: 70.w,
                              child: GestureDetector(
                                onTap: controller.navigateToCreatePlans,
                                child: CircleAvatar(
                                  backgroundColor:
                                      controller.themeService.isDarkMode
                                          ? grayScale700
                                          : Colors.black,
                                  child: Image.asset(
                                    editIcon,
                                    color: controller.themeService.isDarkMode
                                        ? Colors.black
                                        : white,
                                  ),
                                ),
                              ),
                            ),
                            const TextUi.bodyMed('Create Plans')
                          ],
                        ),
                        const Gap(15),
                        Column(
                          children: [
                            SizedBox(
                              height: 70.h,
                              width: 70.w,
                              child: GestureDetector(
                                onTap: controller.navigateToEditProfile,
                                // controller.navigateToProfileEdit,
                                child: CircleAvatar(
                                  backgroundColor:
                                      controller.themeService.isDarkMode
                                          ? grayScale700
                                          : Colors.black,
                                  child: Image.asset(
                                    editIcon,
                                    color: controller.themeService.isDarkMode
                                        ? Colors.black
                                        : white,
                                  ),
                                ),
                              ),
                            ),
                            const TextUi.bodyMed('Edit Profile')
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: const newMemberContainer(),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
