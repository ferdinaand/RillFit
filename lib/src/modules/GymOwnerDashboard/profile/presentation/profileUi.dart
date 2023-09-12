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

import '../../../../presentation/global_widgets/appbar.ui.dart';
import '../../../../presentation/global_widgets/textfield.ui.dart';
import '../../../dashboard/gym/gym_profile/controller/gym_profile_controller.dart';
import '../controller/gymOwnerProfileController.dart';
import 'widgets/GymOwnerProfileForm.dart';

class GymOwnerProfile extends GetView<GymOwnerProfileController> {
  const GymOwnerProfile({super.key});

  @override
  GymOwnerProfileController get controller =>
      Get.put(GymOwnerProfileController());

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: const MainAppbarUi(title: ''),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 0),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUi.heading2(
                        'Profile',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Gap(10),
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
                      const Gap(9),
                    ],
                  ),
                  ProfileEditForm(),
                  Gap(40),
                  SizedBox(
                    height: 50.h,
                    width: 350,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => primary)),
                        onPressed: () {},
                        child: TextUi.bodyLarge('Create')),
                  ),
                  Gap(32)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
