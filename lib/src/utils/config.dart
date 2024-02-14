import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/domain/services/navigation.service.dart';
import 'package:riilfit/src/domain/services/storage.service.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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

Future<void> initializeServices() async {
  ///Init all services here
  Get
    ..lazyPut(StorageService.new)
    ..lazyPut(ThemeService.new)
    ..lazyPut(NavigationService.new)
    ..lazyPut(BaseController.new, fenix: true);
}

class SocketService {
  IO.Socket? socket;

  void connect() {
    socket = IO.io('https://riilfit-api.vercel.app/');
    socket!.connect();
  }

  void disconnect() {
    socket?.disconnect();
  }
}

Future<void> initializeSocketService() async {
  final socketService = SocketService();
  socketService.connect();
}

Future<String> calculateInitialRoute() async {
  String routes = Routes.onboarding;

  // Check if userData or gymOwnerData box exists in Hive
  final userDataBox = await Hive.openBox('userData');
  final gymOwnerDataBox = await Hive.openBox('gymOwnerData');

  // Check if userData or gymOwnerData token has expired
  final userDataToken = userDataBox.get('token');
  final gymOwnerDataToken = gymOwnerDataBox.get('token');
  try {
    if (userDataToken != null) {
      if (JwtDecoder.isExpired(userDataToken.toString())) {
        // Token has expired, navigate to signin screen
        routes = Routes.login;
      } else {
        routes = Routes.app;
      }
    } else if (gymOwnerDataToken != null) {
      if (JwtDecoder.isExpired(gymOwnerDataToken.toString())) {
        routes = Routes.gymOwnerLogin;
      } else {
        routes = Routes.gymOwnerHome;
      }
    } else {
      routes = Routes.onboarding;
    }
  } catch (e) {
    print("this is calculate route result: $e");
    // print(gymOwnerDataToken);
    // print(userDataToken);
  }

  return routes;
}

bool ChooseRoleRoute = false;
bool GymOwnerSelect = false;
bool userSelect = false;
String userName = '';
String firstName = '';
String phoneNumber = '';
late bool isLoading;
bool isLoggedIn = false;

late Box box1;
