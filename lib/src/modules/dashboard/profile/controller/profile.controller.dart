import 'dart:developer';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

class ProfileController extends BaseController {
  String get firstName => currentUser.firstName;

  Future<void> createVendorAccount() async {}

  Future<void> logout() async {
    try {
      // await AuthApi().logout();

      await storageService.deleteAllItems();

      navigationService.logout();

      log('logged out user successfully');
      return;
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
      log('something went wrong with logout, but still navigated user anyways');
      navigationService.logout();
    }
  }
}
