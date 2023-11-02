import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/stores/controller/stores.controller.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/widgets/Store.tab.view.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/widgets/search_field.ui.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';
import 'package:riilfit/src/routing/app_pages.dart';

import '../../../../domain/services/themes.services.dart';

class StoreCart extends GetView<StoresController> {
  const StoreCart({super.key});

  @override
  StoresController get controller => Get.put(StoresController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor:
            Get.find<ThemeService>().isDarkMode ? grayScale900 : grayScale50,
        appBar: MainAppbarUi(
          title: 'Cart',
          actions: [
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextUi.bodyMed(
                  'Clear All',
                  fontWeight: FontWeight.w500,
                )),
            Gap(15)
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(20),
              cartItem(),
              Gap(20),
              cartItem(),
              Gap(20),
              cartItem(),
              Gap(20),
              cartItem(),
              Gap(20),
              cartItem(),
              Gap(20),
              cartItem(),
              Gap(20),
              cartItem(),
              Gap(20),
              cartItem(),
              Gap(20),
              cartItem()
            ],
          ),
        )),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
          child: Container(
            height: 120,
            child: SizedBox(
              width: 250.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUi.bodyLarge(
                        'Total Bill',
                        fontWeight: FontWeight.bold,
                      ),
                      TextUi.bodyLarge(
                        'N100,000',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  PrimaryButtonUi(
                      text: 'Check Out',
                      onPressed: () {
                        // ignore: inference_failure_on_function_invocation
                        Get.toNamed(Routes.addCard);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class cartItem extends StatelessWidget {
  const cartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Get.find<ThemeService>().isDarkMode ? grayScale700 : white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(color: grayScale50),
              child: Image.asset('assets/png/store1.png'),
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUi.bodyLarge(
                  'ADJUSTABLE KETTLEBELL',
                  fontWeight: FontWeight.bold,
                ),
                TextUi.bodyMed(
                  'N10,000',
                ),
              ],
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Get.find<ThemeService>().isDarkMode
                              ? grayScale50
                              : grayScale100,
                        )),
                    child: Center(
                        child: Icon(
                      Icons.remove,
                      size: 15,
                    ))),
                Gap(5),
                TextUi.heading4(
                  '2',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: primary,
                ),
                Gap(5),
                Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Get.find<ThemeService>().isDarkMode
                              ? grayScale50
                              : grayScale100,
                        )),
                    child: Center(
                        child: Icon(
                      Icons.add,
                      size: 15,
                    ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
