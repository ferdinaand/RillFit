import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';
import 'package:riilfit/src/routing/app_pages.dart';

import '../../../../../../data/dummy/member_services.dummy.dart';

class GymCardUi extends GetView<GymController> {
  const GymCardUi({
    super.key,
    required this.logo,
    required this.name,
    required this.address,
    required this.city,
    this.isFavorite = false,
    this.isClosed = false,
    required this.ontap,
  });

  final bool isFavorite;
  final bool isClosed;
  final String logo;
  final String name;
  final String address;
  final String city;
  final VoidCallback ontap;

  @override
  GymController get controller => Get.put(GymController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 270.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage(logo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 24.h,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 0,
                            ).w,
                            decoration: BoxDecoration(
                              color: white.withOpacity(1),
                              borderRadius: const BorderRadius.all(
                                xsmallRadius,
                              ),
                            ),
                            child: Icon(
                              // isFavorite
                              //     ?
                              Icons.favorite
                              // : Icons.favorite_border_rounded
                              ,
                              color:
                                  // isFavorite ?
                                  wineColor
                              //  : grayScale100
                              ,
                              size: 24,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Gap(4),
                        const Gap(4),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: starColor,
                            ),
                            const Icon(
                              Icons.star,
                              color: starColor,
                            ),
                            const Icon(
                              Icons.star,
                              color: starColor,
                            ),
                            const Icon(
                              Icons.star_half,
                              color: starColor,
                            ),
                            const Icon(
                              Icons.star,
                              color: white,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextUi.heading4(
                        name.toUpperCase(),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      // Container(
                      //   height: 20.h,
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 10,
                      //     vertical: 0,
                      //   ).w,
                      //   decoration: BoxDecoration(
                      //     color: grayScale700.withOpacity(.9),
                      //     borderRadius: const BorderRadius.all(
                      //       xsmallRadius,
                      //     ),
                      //   ),
                      //   child:
                      TextUi.bodyMed(
                        isClosed ? 'CLOSED' : 'OPEN',
                        color: isClosed
                            ? grayScale900
                            : successDark, //use grayScale900 when closed
                        fontWeight: semiBoldText,
                        height: (16 / 14).w,
                      ),
                      // ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextUi.bodyMed(
                          '$address, $city',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
