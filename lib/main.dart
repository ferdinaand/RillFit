import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GetStorage.init();

  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);

  runApp(const RiilfitApp());
}

class RiilfitApp extends StatelessWidget {
  const RiilfitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const OverlaySupport.global(
      child: GetMaterialApp(
        title: 'Riilfit',
        debugShowCheckedModeBanner: false,
        home: HomeUi(),
      ),
    );
  }
}

class HomeUi extends StatelessWidget {
  const HomeUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
