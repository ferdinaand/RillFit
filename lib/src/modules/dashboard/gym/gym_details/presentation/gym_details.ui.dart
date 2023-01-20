import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
        appBar: const MainAppbarUi(
          backgroundColor: Colors.transparent,
          title: '',
          iconBackgroundColor: grayScale800,
        ),
        body: Stack(
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
                    height: 18,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    decoration: ShapeDecoration(
                      color: grayScale900.withOpacity(.5),
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
                            width: 10.w,
                            height: 10.w,
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
                  vertical: 24,
                ).w,
                decoration: const BoxDecoration(
                  color: grayScale800,
                  borderRadius: BorderRadius.only(
                    topLeft: bigRadius,
                    topRight: bigRadius,
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const TextUi.heading4(
                              'GetFit Gym',
                              color: grayScale50,
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
                                  color: grayScale50,
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
                                  color: grayScale500,
                                ),
                                Gap(4),
                                TextUi.bodyMed(
                                  '(123 ratings)',
                                  color: grayScale50,
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
                              color: grayScale50,
                            ),
                            const Gap(8),
                            const TextUi.bodyMed(
                              'We are a full service salon and spa, delicating to providing our clients with the absolute best ..',
                              height: 14 / 12,
                              color: grayScale50,
                            ),
                            const Gap(24),
                            const TextUi.bodyMed(
                              'Schedule',
                              fontWeight: boldText,
                              color: grayScale50,
                            ),
                            const Gap(8),
                            const TextUi.bodyMed(
                              'GetFit gym opens on weekdays only, from 6am - 10pm.',
                              height: 14 / 12,
                              color: grayScale50,
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
                                    color: starColor.withOpacity(.3),
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
                                        color: starColor,
                                      ),
                                      const Gap(4),
                                      const TextUi.bodySmall(
                                        'Weekdays only',
                                        height: 14 / 12,
                                        color: starColor,
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
                                    color: successDark.withOpacity(.3),
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
                                        color: successDark,
                                      ),
                                      const Gap(4),
                                      const TextUi.bodySmall(
                                        'Has Membership Plans',
                                        height: 14 / 12,
                                        color: successDark,
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
                              color: grayScale50,
                            ),
                            const Gap(8),
                            Row(
                              children: const [
                                TextUi.bodyMed(
                                  'Website: ',
                                  height: 14 / 12,
                                  color: grayScale50,
                                ),
                                TextUi.bodyMed(
                                  'getfit.gym@gmail.com',
                                  height: 14 / 12,
                                  color: grayScale50,
                                  fontWeight: semiBoldText,
                                ),
                              ],
                            ),
                            const Gap(16),
                            const TextUi.bodyMed(
                              'Social Accounts: ',
                              height: 14 / 12,
                              color: grayScale50,
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
                                      color: grayScale50,
                                      borderRadius: BorderRadius.all(
                                        xsmallRadius,
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      mailIcon,
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
                              color: grayScale50,
                            ),
                            const Gap(8),
                            const TextUi.bodyMed(
                              '231 Rumudomayan Road Port Harcourt',
                              color: grayScale50,
                            ),
                            const Gap(12),
                            Align(
                              alignment: Alignment.centerLeft,
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
    );
  }
}
