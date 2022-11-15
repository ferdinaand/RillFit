import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initializeHive() async {
  //Get application directory (storage directory on device)
  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);

  //Open all hive boxes here
  // await Hive.openBox<UserRepo?>('user');

  //register all adapters here
  // Hive.registerAdapter<UserRepo>(UserRepoAdapter());
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
  });
}
