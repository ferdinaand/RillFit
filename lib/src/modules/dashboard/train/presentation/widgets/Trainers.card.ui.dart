// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../controller/train.controller.dart';

class TrainersCardUi extends GetView<TrainController> {
  const TrainersCardUi({super.key});

  @override
  TrainController get controller => Get.put(TrainController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.openTrainersDetailsPage,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          height: 145,
          width: 333,
          decoration: BoxDecoration(
            color: const Color(0xffE6EAEE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              const Positioned(
                top: 30,
                right: 22,
                child: TextUi.heading3(
                  textAlign: TextAlign.start,
                  color: grayScale900,
                  'Weight Loss\ntraining',
                  fontSize: 18,
                ),
              ),
              Positioned(
                bottom: 21,
                right: 24,
                child: Container(
                  height: 20,
                  width: 58,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/png/Vector.png'),
                      const Gap(4),
                      const TextUi.bodyMed('40 mins',
                          color: grayScale900, fontSize: 10)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 85,
                right: 24,
                bottom: 70,
                child: TextUi.bodySmall(
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400,
                  'Full body workout',
                  color: grayScale800.withOpacity(.4),
                  fontSize: 10,
                ),
              ),
              Positioned(
                left: 1,
                bottom: 1,
                child: Image.asset('assets/png/image6.png'),
              ),
              Positioned(
                bottom: 21,
                left: 94,
                child: Container(
                  height: 20,
                  width: 58,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        size: 10,
                        color: starColor,
                      ),
                      Gap(4),
                      TextUi.bodyMed(
                        '3 Rating',
                        color: grayScale900,
                        fontSize: 10,
                      )
                    ],
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
