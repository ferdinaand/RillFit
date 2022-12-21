import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show DeviceOrientation, PlatformAssetBundle, SystemChrome;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:riilfit/src/domain/services/navigation.service.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:riilfit/src/utils/config.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final data = await PlatformAssetBundle()
      .load('assets/certificates/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GetStorage.init();

  await initializeHive();

  await initializeServices();

  setupLogging();

  runApp(
    const RiilfitApp(),
  );
}

class RiilfitApp extends StatelessWidget {
  const RiilfitApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return OverlaySupport.global(
          child: GetMaterialApp(
            navigatorKey: Get.find<NavigationService>().navigatorKey,
            initialRoute: Routes.onboarding,
            unknownRoute: AppPages.unknownRoute,
            theme: Get.find<ThemeService>().light,
            themeMode: Get.find<ThemeService>().getThemeMode(),
            darkTheme: Get.find<ThemeService>().dark,
            getPages: AppPages.pages,
            title: 'Riilfit',
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
