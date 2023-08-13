import 'dart:convert';

import 'package:get/get.dart';
import 'package:riilfit/src/data/Models/GymLocations.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:http/http.dart' as http;
import 'package:riilfit/src/utils/config.dart';
import '../../../../../routing/app_pages.dart';

class GymLocationsController extends BaseController {
  void onInit() {
    getGymLocations();

    super.onInit();
  }

  var isLoading = false.obs;
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  void gymsInLocation() {
    navigationService.navigateTo(
      isLoggedIn ? Routes.gym : Routes.login,
    );
  }

  void getGymLocations() async {
    // isLoading.value = true;

    // await Future.delayed(Duration(seconds: 3));

    var response = await http.get(
      Uri.parse('https://riilfit-api.vercel.app//gyms/available-locations'),
    );
    // isLoading.value = false;

    final jsonResponse = jsonDecode(response.body);
    var data = jsonResponse['data'];
    var items = data['items'];
    print(items[0]);
    if (jsonResponse['statusCode'] == '200') {
      GymLocations gymLocations = GymLocations();
      gymLocations.city = jsonResponse['city'].toString();
      gymLocations.state = jsonResponse['state'].toString();
    }
  }
}
