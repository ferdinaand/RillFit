import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class UnknownPageUi extends StatelessWidget {
  const UnknownPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: SvgPicture.asset(error404),
            ),
            const Gap(24),
            const TextUi.bodyLarge(
              "Page not found!",
            ),
            const Gap(48),
          ],
        ),
      ),
    );
  }
}
