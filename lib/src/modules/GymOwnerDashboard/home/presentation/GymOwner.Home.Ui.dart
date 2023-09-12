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
        child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 39),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(children: [
                      Row(
                        children: [
                          Image.asset(
                            riilfitLogoPng,
                            height: 32.h,
                          ),
                        ],
                      ),
                      const Gap(50),
                      Row(
                        children: [
                          SizedBox(
                            height: 70.h,
                            width: 70.w,
                            child: CircleAvatar(
                              backgroundColor:
                                  controller.themeService.isDarkMode
                                      ? grayScale700
                                      : Colors.black,
                              child: SvgPicture.asset(userActiveIcon),
                            ),
                          ),
                          const Gap(9),
                          const Column(
                            children: [
                              TextUi.bodyLarge(
                                'Ferdinand',
                                fontWeight: FontWeight.w400,
                              ),
                              TextUi.bodyLarge(
                                'ferds gym',
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Gap(17),
                      const Row(
                        children: [
                          TextUi.heading1(
                            'Dashboard',
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      const Gap(7),
                      const Row(
                        children: [
                          TextUi.bodyLarge(
                            'Your daily updates',
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          const dashContainer(
                            iconPath: backIcon,
                            height: 233,
                            width: 171,
                            Amount: '178,5k',
                            percent: '%7.6',
                          ),
                          const Gap(45),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                          color:
                                              controller.themeService.isDarkMode
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
                                          color:
                                              controller.themeService.isDarkMode
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
                                          color:
                                              controller.themeService.isDarkMode
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
                    ]),
                  ),
                ),
                const newMemberContainer(),
                const Gap(40)
              ],
            )),
      ),
    );
  }
}
