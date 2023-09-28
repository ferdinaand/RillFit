import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../presentation/resources/res.dart';
import '../../../../../presentation/widgets.dart';

class gymPlanCard extends StatelessWidget {
  gymPlanCard({
    required this.description,
    required this.time,
    required this.features,
    required this.subFeatures,
    required this.logo,
    required this.price,
    required this.planType,
    required this.editAction,
    required this.deleteAction,
    required this.OnTap,
    required this.Id,
    super.key,
  });
  final String description;
  final String time;
  final String features;
  final String subFeatures;
  final String logo;
  final String price;
  final String planType;
  final VoidCallback OnTap;
  final VoidCallback editAction;
  final VoidCallback deleteAction;
  final String Id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 42.h,
                  width: 100.w,
                  child: TextButton(
                    child: TextUi.bodyLarge(
                      'Edit',
                      color: primary,
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => primary20),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                    ),
                    onPressed: editAction,
                  ),
                ),
                SizedBox(
                  height: 42.h,
                  width: 100.w,
                  child: TextButton(
                    child: TextUi.bodyLarge(
                      'Delete',
                      color: errorDark,
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => errorLight),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                    ),
                    onPressed: deleteAction,
                  ),
                ),
              ],
            ),
            Gap(5),
            Container(
              height: 250.h,
              width: 352.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: primary),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextUi.heading1(
                              'N$price',
                              fontSize: 32,
                            ),
                            Gap(7),
                            Row(
                              children: [
                                TextUi.bodyMed(
                                  'Per month',
                                  fontSize: 14,
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFFCD7F32)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 4, right: 4),
                            child: Center(
                              child: TextUi.bodyLarge(
                                planType,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Gap(13),
                    Row(
                      children: [
                        Container(
                          width: 300.w,
                          child: TextUi.bodyLarge(
                            description,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Gap(15),
                    Row(
                      children: [
                        Image.asset(
                          timeIcon,
                          color: primary,
                        ),
                        const Gap(5),
                        TextUi.bodyMed(
                          time,
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const Gap(14),
                    Row(
                      children: [
                        Image.asset(
                          weightIcon,
                          color: primary,
                        ),
                        const Gap(5),
                        TextUi.bodyMed(
                          features,
                          style: TextStyle(overflow: TextOverflow.fade),
                        )
                      ],
                    ),
                    const Gap(14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              calendarIcon,
                              color: primary,
                            ),
                            const Gap(5),
                            TextUi.bodyMed(
                              '$subFeatures visits per month',
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        Image.asset(
                          riilfitLogoPng,
                          height: 28.h,
                        ),
                      ],
                    ),
                    Gap(5)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
