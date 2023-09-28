import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/modules/authentication/login/controller/login.controller.dart';

import '../../../../routing/app_pages.dart';
import '../../profile/presentation/profile.ui.dart';

class HomeController extends BaseController {
  String get firstName => currentUser.firstName;
  RxString fullname = ''.obs;
  RxString username = ''.obs;

  RxString phoneNumber = ''.obs;

  @override
  void onInit() {
    // Call fetchUserData here when the HomeController is initialized
    fetchUserData();
    super.onInit();
  }

  void openGymProfilePage() {
    navigationService.navigateTo(
      Routes.gymProfile,
    );
  }

  // void updateUserInfo(String name, String user, String phone) {
  //   print('this function ran');

  //   fullname.value = name;
  //   phoneNumber.value = phone;

  //   username.value = user;
  //   // print(username.value);
  // }

  Future<void> fetchUserData() async {
    final userDataBox = await Hive.openBox('userData');
    final fullName = userDataBox.get('fullname', defaultValue: '');
    final username = userDataBox.get('username', defaultValue: '');
    final phoneNumber = userDataBox.get('phone', defaultValue: '');

    // Update the observable variables
    fullname.value = fullName.toString();
    this.username.value = username.toString();
    this.phoneNumber.value = phoneNumber.toString();

    // await userDataBox.close();
  }
}
