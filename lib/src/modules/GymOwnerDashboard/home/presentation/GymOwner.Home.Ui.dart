import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/GymOwnerDashboard/home/presentation/widgets/dashboard%20.container.dart';
import 'package:riilfit/src/modules/GymOwnerDashboard/home/presentation/widgets/members_count.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/presentation/resources/icons.res.dart';
import 'package:riilfit/src/utils/config.dart';

import '../../../../presentation/global_widgets/gap.ui.dart';
import '../../../../presentation/resources/images.res.dart';
import '../controller/gymOwnerHomeController.dart';

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
          padding: const EdgeInsets.only(left: 32, right: 32, top: 39),
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
                            backgroundColor: controller.themeService.isDarkMode
                                ? grayScale700
                                : Colors.black,
                            child: SvgPicture.asset(userActiveIcon),
                          ),
                        ),
                        Gap(9),
                        Column(
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
                    Row(
                      children: const [
                        TextUi.heading1(
                          'Dashboard',
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Gap(7),
                    Row(
                      children: const [
                        TextUi.bodyLarge(
                          'Your daily updates',
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Gap(20),
                    Row(
                      children: [
                        dashContainer(
                          iconPath: backIcon,
                          height: 233,
                          width: 171,
                          Amount: '178,5k',
                          percent: '%7.6',
                        ),
                        Gap(45),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 70.h,
                                  width: 70.w,
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
                                TextUi.bodyMed('Edit Plans'),
                              ],
                            ),
                            Gap(35),
                            Column(
                              children: [
                                SizedBox(
                                  height: 70.h,
                                  width: 70.w,
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
                                TextUi.bodyMed('Edit Profile')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              Container(
                height: 89.h,
                width: 298.w,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: white, width: 2),
                                  image: DecorationImage(
                                      image: AssetImage(newMember3)),
                                  shape: BoxShape.circle),
                            ),
                            Positioned(
                              left: 35,
                              child: Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: white, width: 2),
                                    image: DecorationImage(
                                        image: AssetImage(newMember2)),
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Positioned(
                              left: 70,
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: white, width: 2),
                                    image: DecorationImage(
                                        image: AssetImage(newMember1)),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextUi.bodyMed(
                        'onboarded\nMembers',
                        color: white,
                      )
                    ],
                  ),
                ),
              ),
              Gap(40)
            ],
          )),
    ));
  }
}
