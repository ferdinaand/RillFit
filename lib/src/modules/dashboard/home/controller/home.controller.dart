import 'package:riilfit/src/domain/base/controller/base.controller.dart';

import '../../../../routing/app_pages.dart';
import '../../profile/presentation/profile.ui.dart';

class HomeController extends BaseController {
  String get firstName => currentUser.firstName;
  void openGymProfilePage() {
    navigationService.navigateTo(
      Routes.gymProfile,
    );
  }
}
