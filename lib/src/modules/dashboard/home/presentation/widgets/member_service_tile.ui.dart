import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dummy/member_services.dummy.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class ServicesTileUi extends StatelessWidget {
  const ServicesTileUi(this.service, {super.key});
  final MemberServices service;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: GestureDetector(
        onTap: () {
          Get.toNamed<void>(
            service.route,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 153,
                width: 360,
                margin: const EdgeInsets.only(
                  bottom: 0,
                ).r,
                decoration: BoxDecoration(
                  color: service.color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUi.bodyXL(
                        service.name,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: white,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 200,
                top: -25,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 41),
                  child: Image.asset(
                    service.image,
                    height: 180,
                    width: 180,
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
