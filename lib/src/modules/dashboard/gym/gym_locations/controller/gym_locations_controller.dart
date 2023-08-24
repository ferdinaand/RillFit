// ignore_for_file: avoid_dynamic_calls, avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:riilfit/src/data/Models/GymLocations.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:http/http.dart' as http;
import 'package:riilfit/src/presentation/resources/colors.res.dart';

import '../../../../../data/Models/gymsList.dart';
import '../../../../../routing/app_pages.dart';

class GymLocationsController extends BaseController {
  void onInit() {
    getGymLocations();

    super.onInit();
  }

// location list..........
  var locationList = <GymLocations>[].obs;
  // var GymLists = <GymList>[].obs;

  var thisGymList = <GymList>[].obs;

  RxBool isLocationLoading = false.obs;
  RxBool isGymListLoading = false.obs;
  var isLoading = false.obs;

  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  void gymsInLocation() {
    navigationService.navigateTo(
        // isLoggedIn ?
        Routes.gym
        //  :
        //  Routes.login,
        );
  }

//select a city when clicked
  final RxString selectedCity = ''.obs;

  void setSelectedCity(String city) {
    selectedCity.value = city;
  }
//++++++++++++++++++++++++++++++++++++

  void getGymLocations() async {
    // isLoading.value = true;
    isLocationLoading(true);
    // await Future.delayed(Duration(seconds: 7));

    try {
      final response = await http.get(
        Uri.parse('https://riilfit-api.vercel.app//gyms/available-locations'),
      );
      // isLoading.value = false;

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        final data = jsonResponse['data']['items'];
        locationList.clear();
        // final List items = data;

        //remove print calls
        // print(data);
        // print("1111");

        isLocationLoading(false);
        for (final item in data as List<dynamic>) {
          // print("3333");
          // print(data);
          final state = item['state'] as String;
          final city = item['city'] as String;

          // print(state);
          // print(city);
          // print('444444');

          final gymLocation = GymLocations(state: state, city: city);
          locationList.add(gymLocation);

          // print('555555');
          // print(locationList);
        }
//       locationList.value = data.
// //map((e) => GymLocations.fromJson(e)).toList();

        update();
      } else {
        Get.snackbar('Error', 'Network error');
      }
    } catch (e) {
      Get.snackbar('error', '$e', backgroundColor: errorDark);
    }
  }

  Future<void> fetchGymList() async {
    final selectedCityValue = selectedCity.value;
    isGymListLoading(true);
    try {
      print('fetch gyms in selected city');

      final response = await http.get(
        Uri.parse(
            'https://riilfit-api.vercel.app//gyms?city=$selectedCityValue'),
      );

      // print(response.body);
      // isLoading.value = false;
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        final data = jsonResponse['data']['items'];
        thisGymList.clear();

        // print(data);
        isGymListLoading(false);
        for (final item in data as List<dynamic>) {
          // print("3333");
          // print(data);
          final id = item['_id'] as String;
          final city = item['locations'][0]['city'] as String;
          final address = item['locations'][0]['address'] as String;
          final name = item['name'] as String;
          final logo = item['thumbnail'] as String;
          print('44444');
          print(address);
          print(city);
          print(name);
          print(id);

          print(logo);

          final gymList = GymList(
              id: id, city: city, address: address, name: name, logo: logo);
          thisGymList.add(gymList);

          // thisGymList.value = gymList;

          // print('555555');
          // print(_gymList);
        }
//       locationList.value = data.
// //map((e) => GymLocations.fromJson(e)).toList();

        update();
      } else {
        Get.snackbar('error', '', backgroundColor: errorDark);
      }
    } catch (e) {
      Get.snackbar('error', '$e', backgroundColor: errorDark);
    }
  }
}
