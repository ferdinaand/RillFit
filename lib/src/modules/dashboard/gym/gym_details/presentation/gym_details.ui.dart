import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_details/controller/gym_details.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class GymDetailsUi extends GetView<GymDetailsController> {
  const GymDetailsUi({super.key});

  @override
  GymDetailsController get controller => Get.put(GymDetailsController());

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
        extendBodyBehindAppBar: true,
        appBar: MainAppbarUi(
          backgroundColor: Colors.transparent,
          title: '',
          iconColor: themeService.isDarkMode ? grayScale50 : grayScale800,
          iconBackgroundColor: themeService.isDarkMode ? grayScale800 : white,
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
                child: Container(
                  height: context.height * 0.33,
                  padding: const EdgeInsets.only(bottom: 12),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        servicesImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 24,
                      margin: EdgeInsets.only(bottom: context.height * 0.03),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 6,
                      ),
                      decoration: ShapeDecoration(
                        color: themeService.isDarkMode
                            ? grayScale900.withOpacity(.5)
                            : white,
                        shape: const StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [1, 2, 3].asMap().entries.map((entry) {
                          final index = entry.key;
                          return Obx(
                            () => AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 8.w,
                              height: 8.w,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ).w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currentIndex == index
                                    ? primary
                                    : grayScale100,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
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
                              const TextUi.heading4(
                                'GetFit Gym',
                              ),
                              const Gap(8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 2,
                                    ).w,
                                    decoration: BoxDecoration(
                                      color: successDark.withOpacity(.3),
                                      borderRadius: const BorderRadius.all(
                                        xsmallRadius,
                                      ),
                                    ),
                                    child: TextUi.bodyMed(
                                      'OPEN',
                                      color: successDark,
                                      fontWeight: boldText,
                                      height: (16 / 14).w,
                                    ),
                                  ),
                                  const Gap(8),
                                  TextUi.bodyMed(
                                    'Closes at 9:00pm WAT',
                                    fontWeight: mediumText,
                                    height: (16 / 14).w,
                                  ),
                                ],
                              ),
                              const Gap(16),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: starColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: starColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: starColor,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    color: starColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: grayScale400,
                                  ),
                                  Gap(4),
                                  TextUi.bodyMed(
                                    '(123 ratings)',
                                    fontWeight: mediumText,
                                    height: 16 / 14,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.favorite_border_rounded,
                                    color: grayScale100,
                                    size: 28,
                                  ),
                                ],
                              ),
                              const Gap(24),
                              const TextUi.bodyMed(
                                'Description',
                                fontWeight: boldText,
                              ),
                              const Gap(8),
                              const TextUi.bodyMed(
                                'We are a full service salon and spa, delicating to providing our clients with the absolute best ..',
                                height: 14 / 12,
                              ),
                              const Gap(24),
                              const TextUi.bodyMed(
                                'Schedule',
                                fontWeight: boldText,
                              ),
                              const Gap(8),
                              const TextUi.bodyMed(
                                'GetFit gym opens on weekdays only, from 6am - 10pm.',
                                height: 14 / 12,
                              ),
                              const Gap(24),
                              Wrap(
                                spacing: 20,
                                runSpacing: 16,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ).w,
                                    decoration: BoxDecoration(
                                      color: Colors.orange[50],
                                      borderRadius: const BorderRadius.all(
                                        xsmallRadius,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 20.w,
                                          color: Colors.orange,
                                        ),
                                        const Gap(4),
                                        const TextUi.bodySmall(
                                          'Weekdays only',
                                          height: 14 / 12,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ).w,
                                    decoration: BoxDecoration(
                                      color: Colors.teal[100],
                                      borderRadius: const BorderRadius.all(
                                        xsmallRadius,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.card_membership,
                                          size: 20.w,
                                          color: Colors.teal[900],
                                        ),
                                        const Gap(4),
                                        TextUi.bodySmall(
                                          'Has Membership Plans',
                                          height: 14 / 12,
                                          color: Colors.teal[800],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(24),
                              const TextUi.bodyMed(
                                'Contact GetFit via;',
                                fontWeight: boldText,
                              ),
                              const Gap(8),
                              Row(
                                children: const [
                                  TextUi.bodyMed(
                                    'Website: ',
                                    height: 14 / 12,
                                  ),
                                  TextUi.bodyMed(
                                    'getfit.gym@gmail.com',
                                    height: 14 / 12,
                                    fontWeight: semiBoldText,
                                  ),
                                ],
                              ),
                              const Gap(16),
                              const TextUi.bodyMed(
                                'Social Accounts: ',
                                height: 14 / 12,
                              ),
                              const Gap(8),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.all(
                                          xsmallRadius,
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        outgoingCallIcon,
                                        color: grayScale800,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          xsmallRadius,
                                        ),
                                        color: Colors.orange,
                                      ),
                                      child: SvgPicture.asset(
                                        mailIcon,
                                        color: grayScale800,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: whatsappColor,
                                        borderRadius: BorderRadius.all(
                                          xsmallRadius,
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        whatsappIcon,
                                        color: grayScale800,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: twitterColor,
                                        borderRadius: BorderRadius.all(
                                          xsmallRadius,
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        twitterIcon,
                                        color: grayScale800,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: instagramColor,
                                        borderRadius: BorderRadius.all(
                                          xsmallRadius,
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        instagramIcon,
                                        color: grayScale800,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                ],
                              ),
                              const Gap(24),
                              const TextUi.bodyMed(
                                'Location',
                                fontWeight: boldText,
                              ),
                              const Gap(8),
                              const TextUi.bodyMed(
                                '231 Rumudomayan Road Port Harcourt',
                              ),
                              const Gap(12),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ).w,
                                    decoration: const BoxDecoration(
                                      color: grayScale400,
                                      borderRadius: BorderRadius.all(
                                        xsmallRadius,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          directionsIcon,
                                          color: grayScale900,
                                        ),
                                        const Gap(4),
                                        const TextUi.bodySmall(
                                          'Get Directions',
                                          height: 14 / 12,
                                          color: grayScale900,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(32),
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
