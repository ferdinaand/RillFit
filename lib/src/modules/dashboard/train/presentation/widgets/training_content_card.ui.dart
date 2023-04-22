import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/modules/dashboard/train/controller/train.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class TrainingContentCardUi extends GetView<TrainController> {
  const TrainingContentCardUi({
    super.key,
    required this.workoutName,
    this.isFavorite = false,
  });

  final bool isFavorite;
  final String workoutName;

  @override
  TrainController get controller => Get.put(TrainController());
  @override
  Widget build(BuildContext context) {
    const double size = 13;
    return Scaffold(
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
              child: Container(
                height: context.height * 0.55,
                padding: const EdgeInsets.only(bottom: 12),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      trainingContentImg,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: context.height * 0.5,
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
                              children: const [
                                TextUi.heading4(
                                  'CORE STRENGTH',
                                  fontSize: 14,
                                  fontWeight: blackText,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const Gap(0),
                            Row(
                              children: [
                                TextUi.bodyMed(
                                  'with Ferdinand Ekpo',
                                  fontWeight: regularText,
                                  height: (16 / 14).w,
                                ),
                              ],
                            ),
                            const Gap(46),

                            // const Expanded(
                            //     child: Divider(
                            //   height: 1,
                            // )),

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
                                  ' 7 mins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )
                              ],
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/png/weight.png',
                                  color: Get.find<ThemeService>().isDarkMode
                                      ? grayScale100
                                      : grayScale900,
                                ),
                                const Gap(15),
                                const TextUi.bodyMed(
                                  ' None',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )
                              ],
                            ),
                            const Gap(42),
                            const TextUi.bodyMed(
                              'About',
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                            const Gap(8),
                            const TextUi.bodyMed(
                              'Give feedback, ask questions, or start a discussion in the comments.',
                              height: 14 / 12,
                              fontWeight: FontWeight.w400,
                            ),
                            const Gap(42),

                            Gap(30),
                            Gap(37),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 57, right: 57),
                              child: PrimaryButtonUi(
                                text: 'View Workout',
                                onPressed: () {},
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
    );
  }
}
