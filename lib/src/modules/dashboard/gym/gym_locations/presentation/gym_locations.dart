import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_locations/presentation/widgets/gym_location_card.dart';
import 'package:riilfit/src/presentation/global_widgets/text.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';

import '../../../../../presentation/resources/images.res.dart';
import '../../../../../presentation/widgets.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 39),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                riilfitLogoPng,
                height: 28.h,
              ),
            ),
            const Gap(50),
            Padding(
              padding: const EdgeInsets.only(left: 37),
              child: Row(
                children: const [
                  TextUi.heading3(
                    'Available Location',
                    fontSize: 24,
                  )
                ],
              ),
            ),
            Gap(20),
            SingleChildScrollView(
              child: Column(
                children: [
                  LocationCard(location: 'Victoria Island'),
                  LocationCard(location: 'Lekki'),
                  LocationCard(location: 'Ikeja'),
                  LocationCard(location: 'Calabar'),
                  LocationCard(location: 'Port Harcourt'),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
