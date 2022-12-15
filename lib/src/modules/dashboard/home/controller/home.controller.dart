import 'package:riilfit/src/domain/base/controller/base.controller.dart';

class HomeController extends BaseController {
  String get firstName => currentUser.firstName;
}
