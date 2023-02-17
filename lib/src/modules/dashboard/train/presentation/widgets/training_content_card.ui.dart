import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
    return SizedBox(
      height: 120.h,
      width: context.width * .45,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  smallRadius,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    servicesImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  smallRadius,
                ),
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  stops: [0.0, 1.0],
                  colors: [
                    Colors.black12,
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 22.h,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ).w,
                      decoration: BoxDecoration(
                        color: grayScale50.withOpacity(.7),
                        borderRadius: const BorderRadius.all(
                          xsmallRadius,
                        ),
                      ),
                      child: Obx(
                        () => TextUi.bodySmall(
                          controller.trainingLevel.value.name.capitalizeFirst!,
                          color: controller.trainingLevel.value
                              .color, //use grayScale900 when closed
                          fontWeight: semiBoldText,
                          height: (18 / 12).h,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextUi.bodyMed(
                    'Never Miss $workoutName day',
                    color: grayScale50,
                  ),
                  Row(
                    children: const [
                      TextUi.bodySmall(
                        '2.37 mins',
                        color: grayScale50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
