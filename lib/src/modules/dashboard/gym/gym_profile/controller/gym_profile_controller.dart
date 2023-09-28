import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

import '../../../../../routing/app_pages.dart';

class GymProfileController extends BaseController {
  final _currentIndex = 0.obs;
  var name = ''.obs;
  int get currentIndex => _currentIndex.value;

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  Future<void> fetchUserData() async {
    final userDataBox = await Hive.openBox('userData');
    final fullName = userDataBox.get('fullname', defaultValue: '');
    final username = userDataBox.get('username', defaultValue: '');
    final phoneNumber = userDataBox.get('phone', defaultValue: '');

    // Update the observable variables
    name.value = fullName.toString();
  }

  final isSelected = true.obs;
  void openGymTagPage() {
    Get.offAndToNamed<void>(
      Routes.gymTag,
    );
  }
}
