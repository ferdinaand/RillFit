// import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// void configureAdapters() {
//   Hive.registerAdapter<UserRepo>(UserRepoAdapter());
// }

// Future<void> configureHive() async {
//   await Hive.openBox<UserRepo?>('user');
//   await Hive.openBox<bool>('pinLock');
// }

// void setupLogging() {
//   Logger.root.level = Level.ALL;
//   Logger.root.onRecord.listen((rec) {
//     if (kDebugMode) {
//       print('${rec.level.name}: ${rec.time}: ${rec.message}');
//     }
//   });
// }