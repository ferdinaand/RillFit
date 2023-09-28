// ignore_for_file: avoid_dynamic_calls, avoid_print, inference_failure_on_function_invocation, strict_raw_type

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riilfit/src/data/Models/GymDetails.dart';

import 'package:riilfit/src/data/Models/GymLocations.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:http/http.dart' as http;
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/utils/config.dart';

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
  Rx<gymDetails> thisGymDetails = gymDetails().obs;
  var thisGymList = <GymList>[].obs;

  RxBool isLocationLoading = false.obs;
  RxBool isGymListLoading = false.obs;
  var isLoading = false.obs;
  var Id = ''.obs;

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

    await Future.delayed(Duration(seconds: 5));
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
          Id.value = gymList.id;

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

  Future getAccessCode() async {
    final box = await Hive.openBox('userData');
    return box.get('token');
  }

  Future<void> fetchGymDetails(String gymId) async {
    final accessCode = await getAccessCode();

    // Check if the user is signed in and accessCode is not null
    if (accessCode != null) {
      // Make your fetch request with accessCode
      print(accessCode);
      print(gymId);
      try {
        final response = await http.get(
          Uri.parse('https://riilfit-api.vercel.app/gyms/$gymId'),
          headers: {
            'Authorization': 'Bearer $accessCode', // Pass accessCode in headers
          },
        );
        if (response.statusCode == 200) {
          final jsonResponse = jsonDecode(response.body);

          final data = jsonResponse['data'];
          // thisGymDetails.value = '' as gymDetails;
          thisGymDetails.value = gymDetails.fromJson(data);
          print(thisGymDetails.value.name);
          print(thisGymDetails.value.phoneNumber);
          print(thisGymDetails.value.city);
          print(thisGymDetails.value.thumbnail);
          print(thisGymDetails.value.openingTime);
          print(thisGymDetails.value.closingTime);
          // print(data);
          // isGymListLoading(false);
          // print(data);

          update();
        } else {
          Get.snackbar('error', "${response.body}", backgroundColor: errorDark);
        }
      } catch (e) {
        Get.snackbar('', '$e');
      }
      // Handle  the response and update your UI with gym details
      // ...
    } else {
      // Handle the case when the user is not signed in
      // ...
    }
  }

  Future<bool> checkUserProfileExists() async {
    isLoading.value = true;
    try {
      // Get the user from the Rx observable
      final box = await Hive.openBox('userData');
      var token = box.get('token');

      if (token != null) {
        // Get the user's UID

        return true;
        // If the snapshot has a value, the user profile exists
      }

      // User profile doesn't exist
      return false;
    } catch (e) {
      // Handle any errors or exceptions here
      print('Error checking user profile: $e');
      return false; // You can handle this differently based on your needs
    }
  }

  bool isTokenExpired(String token) {
    try {
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      if (decodedToken.containsKey('exp')) {
        final int expirationTimestamp = decodedToken['exp'] as int;
        final DateTime expirationDateTime =
            DateTime.fromMillisecondsSinceEpoch(expirationTimestamp * 1000);
        final DateTime currentDateTime = DateTime.now();

        // Check if the token is expired
        if (currentDateTime.isAfter(expirationDateTime)) {
          return true; // Token is expired
        }
      }
    } catch (e) {
      // Handle any decoding errors here
      print('Error decoding token: $e');
      return false;
    }

    return false; // Token is not expired or couldn't be decoded
  }

  void viewPlan(String id) async {
    box1 = await Hive.openBox('userData');
    box1..put('selectedGymId', id);
  }
}
