// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../data/dummy/member_services.dummy.dart';
import '../../controller/train.controller.dart';

class TrainersCardUi extends GetView<TrainController> {
  const TrainersCardUi({super.key});

  @override
  TrainController get controller => Get.put(TrainController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: controller.openTrainersDetailsPage,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              mainAxisExtent: 175),
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  ClipRect(
                    child:
                        Image.asset("${trainersMap.elementAt(index)['image']}"),
                  ),
                  TextUi.heading4(
                    "${trainersMap.elementAt(index)['name']}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  TextUi.bodyMed("${trainersMap.elementAt(index)['role']}")
                ],
              ),
            );
          },
          itemCount: trainersMap.length,
        ));
  }
}
