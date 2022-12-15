import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riilfit/src/data/dummy/member_services.dummy.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class ServicesUi extends StatelessWidget {
  const ServicesUi(this.service, {super.key});
  final MemberServices service;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: Container(
        margin: const EdgeInsets.only(bottom: 28).r,
        decoration: const BoxDecoration(
          color: grayScale800,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          image: DecorationImage(
            image: AssetImage(
              servicesImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(
                  right: 10.w,
                  top: 20.h,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 4,
                ),
                decoration: const BoxDecoration(
                  color: grayScale500,
                  borderRadius: BorderRadius.all(
                    smallRadius,
                  ),
                ),
                child: const TextUi.bodySmall(
                  'See more',
                  height: 1,
                  color: white,
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  bottom: 20.h,
                ),
                child: TextUi.bodyXL(
                  service.name,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
