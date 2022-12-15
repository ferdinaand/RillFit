import 'package:riilfit/src/domain/base/controller/base.controller.dart';

class ProfileController extends BaseController {
  String get firstName => currentUser.firstName;
}
