import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingUi extends StatelessWidget {
  const OnBoardingUi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Onboarding'),
    ),);
  }
}
