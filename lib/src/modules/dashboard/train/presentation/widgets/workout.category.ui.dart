import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../presentation/resources/colors.res.dart';

class WorkoutCategoryCardUi extends StatelessWidget {
  const WorkoutCategoryCardUi(
      {super.key, required this.Image, required this.Text});

  final String Image;
  final String Text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 350,
      decoration: BoxDecoration(
          image: DecorationImage(
              scale: 0.5,
              image: AssetImage(
                Image,
              )),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: TextUi.heading2(
          Text,
          color: white,
        ),
      ),
    );
  }
}
