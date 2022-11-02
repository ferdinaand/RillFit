import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:riilfit/src/modules/onboarding/presentation/onboarding.ui.dart';
import 'package:riilfit/src/routing/app_pages.dart';
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GetStorage.init();

  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);

  // configureAdapters();
  // await configureHive();

  // setupLogging();
  runApp(const MyApp());
}
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const OverlaySupport.global( 
       child: GetMaterialApp(
        home:OnBoardingUi(),
        // initialRoute: Routes.onboarding,
      title: 'Riilfit',
      debugShowCheckedModeBanner: false,
    ));
  }
}

