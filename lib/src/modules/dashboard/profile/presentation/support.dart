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
          title: 'Support',
          // actions: [
          //   Padding(
          //       padding: const EdgeInsets.only(top: 15),
          //       child: TextUi.bodyMed(
          //         'Clear All',
          //         fontWeight: FontWeight.w500,
          //       )),
          //   Gap(15)
          // ],
        ),
        body: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}
