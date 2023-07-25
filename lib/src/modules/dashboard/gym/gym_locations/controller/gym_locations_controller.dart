import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

import '../../../../../routing/app_pages.dart';

class GymLocationsController extends BaseController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  void gymsInLocation() {
    navigationService.navigateTo(
      Routes.gym,
    );
  }
}
