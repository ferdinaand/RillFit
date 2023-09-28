import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_details/controller/gym_details.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import '../../gym_locations/controller/gym_locations_controller.dart';

class GymDetailsUi extends GetView<GymLocationsController> {
  const GymDetailsUi({super.key});

  @override
  GymLocationsController get controller => Get.put(GymLocationsController());

  @override
  Widget build(BuildContext context) {
    const double size = 13;
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MainAppbarUi(
          backgroundColor: Colors.transparent,
          title: '',
          iconColor: themeService.isDarkMode ? white : white,
          iconBackgroundColor:
              themeService.isDarkMode ? grayScale800 : white.withOpacity(0),
        ),
        body: DefaultTextStyle.merge(
          style: TextStyle(
            color: themeService.isDarkMode ? grayScale50 : grayScale700,
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Obx(
                    () => Container(
                      height: context.height * 0.33,
                      padding: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            '${controller.thisGymDetails.value.thumbnail}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: context.height * 0.7,
                  padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ).w +
                      const EdgeInsets.only(top: 24).w,
                  decoration: BoxDecoration(
                    color: themeService.isDarkMode ? grayScale800 : white,
                    borderRadius: const BorderRadius.only(
                      topLeft: bigRadius,
                      topRight: bigRadius,
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: CustomScrollView(
                      scrollBehavior: const ScrollBehavior().copyWith(
                        overscroll: false,
                      ),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Obx(
                                    () => TextUi.heading4(
                                      '${controller.thisGymDetails.value.name}',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ).w,
                                    decoration: BoxDecoration(
                                      color: grayScale800.withOpacity(.9),
                                      borderRadius: const BorderRadius.all(
                                        xsmallRadius,
                                      ),
                                    ),
                                    child: TextUi.bodyMed(
                                      'OPEN',
                                      fontSize: 13,
                                      color: successDark,
                                      fontWeight: boldText,
                                      height: (16 / 14).w,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(8),
                              Row(
                                children: [
                                  Obx(
                                    () => TextUi.bodyMed(
                                      '${controller.thisGymDetails.value.address}',
                                      fontWeight: mediumText,
                                      height: (16 / 14).w,
                                    ),
                                  )
                                ],
                              ),
                              const Gap(4.92),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: size,
                                    color: grayScale400,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: size,
                                    color: grayScale400,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: size,
                                    color: grayScale400,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    size: size,
                                    color: grayScale400,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: size,
                                    color: grayScale400,
                                  ),
                                  Gap(4),
                                  TextUi.bodyMed(
                                    '(0 ratings)',
                                    fontSize: 14,
                                    fontWeight: mediumText,
                                    height: 16 / 14,
                                  ),
                                ],
                              ),
                              const Gap(20),
                              const Expanded(
                                  child: Divider(
                                height: 1,
                              )),
                              const Gap(23),
                              const TextUi.bodyMed(
                                'Information',
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                              const Gap(8),
                              Obx(
                                () => TextUi.bodyMed(
                                  controller.thisGymDetails.value.description !=
                                          null
                                      ? '${controller.thisGymDetails.value.description}'
                                      : '...',
                                  height: 14 / 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Gap(42),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/png/link-2.png',
                                    color: Get.find<ThemeService>().isDarkMode
                                        ? grayScale100
                                        : grayScale900,
                                  ),
                                  const Gap(15),
                                  Obx(
                                    () => TextUi.bodyMed(
                                      controller.thisGymDetails.value.website !=
                                              null
                                          ? '${controller.thisGymDetails.value.website}'
                                          : '...',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              Gap(30),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/png/send-2.png',
                                    color: Get.find<ThemeService>().isDarkMode
                                        ? grayScale100
                                        : grayScale900,
                                  ),
                                  const Gap(15),
                                  Obx(
                                    () => TextUi.bodyMed(
                                      '${controller.thisGymDetails.value.address}',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              Gap(30),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/png/call.png',
                                    color: Get.find<ThemeService>().isDarkMode
                                        ? grayScale100
                                        : grayScale900,
                                  ),
                                  const Gap(15),
                                  Obx(
                                    () => TextUi.bodyMed(
                                      '${controller.thisGymDetails.value.phoneNumber}',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(30),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/png/clock.png',
                                    color: Get.find<ThemeService>().isDarkMode
                                        ? grayScale100
                                        : grayScale900,
                                  ),
                                  const Gap(15),
                                  const TextUi.bodyMed(
                                    'open',
                                    fontWeight: FontWeight.w400,
                                    color: successDark,
                                    fontSize: 15,
                                  ),
                                  Gap(5),
                                  Obx(() => TextUi.bodyMed(
                                        '${controller.thisGymDetails.value.openingTime}am - ${controller.thisGymDetails.value.closingTime}pm',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ))
                                ],
                              ),
                              Gap(41),
                              Row(
                                children: [
                                  TextUi.heading4(
                                    'Socials',
                                    fontSize: 17,
                                  )
                                ],
                              ),
                              const Gap(27),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/png/snapchat.png',
                                    color: Get.find<ThemeService>().isDarkMode
                                        ? grayScale100
                                        : grayScale900,
                                  ),
                                  Gap(14),
                                  Image.asset(
                                    'assets/png/facebook.png',
                                    color: Get.find<ThemeService>().isDarkMode
                                        ? grayScale100
                                        : grayScale900,
                                  ),
                                  Gap(14),
                                  Image.asset(
                                    'assets/png/whatsapp.png',
                                    color: Get.find<ThemeService>().isDarkMode
                                        ? grayScale100
                                        : grayScale900,
                                  ),
                                  Gap(14),
                                  Image.asset(
                                    'assets/png/instagram.png',
                                    color: Get.find<ThemeService>().isDarkMode
                                        ? grayScale100
                                        : grayScale900,
                                  ),
                                ],
                              ),
                              Gap(37),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 57, right: 57),
                                child: PrimaryButtonUi(
                                  text: 'View Gym Plans',
                                  onPressed: () {
                                    final id =
                                        controller.thisGymDetails.value.id;
                                    controller.viewPlan(id.toString());

                                    Get.toNamed(Routes.gymPlan);
                                  },
                                ),
                              ),
                              Gap(15)
                            ],
                          ),
                        ),
                      ],
                    ),
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
