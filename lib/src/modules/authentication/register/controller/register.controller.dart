// ignore_for_file: type_annotate_public_apis, prefer_is_not_empty, prefer_final_locals, prefer_single_quotes, prefer_const_constructors, inference_failure_on_instance_creation, avoid_dynamic_calls, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/dto.dart';
import 'package:riilfit/src/data/enum/error_type.enum.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/data/extensions/string.extensions.dart';
import 'package:riilfit/src/domain/api/auth/auth.api.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/presentation/resources/strings.res.dart';
import 'package:riilfit/src/presentation/utility/flushbar/show-flushbar.helper.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../utils/config.dart';

dynamic url = 'https://riilfit-backend.vercel.app/auth/register';
const Gender = 'MF';
const lastname = "rill";

class RegisterController extends BaseController {
  late GlobalKey<FormState> registerFormKey;
  var isLoading = false.obs;
  SharedPreferences? pref;
  var gym_name = ''.obs;

  @override
  void onInit() {
    enableButton();
    registerFormKey = GlobalKey<FormState>(debugLabel: 'Register');
    createBox();
    initSharedPref();

    super.onInit();
  }

  // Future<void> selectGym() async {
  //   final box = await Hive.openBox('userData');

  // }

  void createBox() async {
    final box = await Hive.openBox('userData');
    if (box.containsKey('gym_name')) {
      final gymName = box.get('gym_name', defaultValue: '');
      final gymId = box.get('gym_id', defaultValue: '');
      print(gymId);
      print('Fetched gym_name: $gymName');
      gym_name.value = gymName.toString();
      gymNameController.text = gymName.toString();
    } else {
      print('Key "gym_name" does not exist in userData box.');
    }
  }

  void initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }

  //text field controllers
  final nameController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  final phoneController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  final passwordController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  final usernameController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final gymNameController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value = nameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        gymNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty;

    return;
  }

  void navigateToLoginPage() {
    Get.offAndToNamed<void>(
      Routes.login,
    );
  }

/////persiting user login in data with hive
  Future<void> persistData() async {
    final box = await Hive.openBox('userData');
    box
      ..put('phone', phoneController.text)
      ..put('fullname', nameController.text);
  }

//signup with node js backend
  Future<void> signUp() async {
    final box = await Hive.openBox('userData');
    final gymId = box.get('gym_id', defaultValue: '');
    // gym_name.value = gymName.toString();
    var signupBody = {
      'fullName': nameController.text,
      'username': usernameController.text,
      'phone': phoneController.text,
      'password': passwordController.text,
      'gym': gymId
    };
    print(gymId);
    firstName = nameController.text;
    userName = usernameController.text;
    phoneNumber = phoneController.text;

    var response = await http.post(
      Uri.parse('https://riilfit-api.vercel.app/auth/users/signup'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(signupBody),
    );

    var jsonResponse = jsonDecode(response.body);

    isLoading.value = true;
    persistData();
    await Future.delayed(Duration(seconds: 3));

    print(jsonResponse);
    if (jsonResponse['access_token'] != null) {
      Get.snackbar('success', 'Registered in successfully');
      // final token = jsonResponse;
      // if (token != null) {
      //   await pref?.setString('token', token.toString());
      // }

      await Get.offAllNamed<void>(
        Routes.login,
      );
    } else if (jsonResponse['message'] == 'please provide strong password') {
      Get.snackbar('please provide strong password',
          'password must contain 8+ characters, an uppercase(A,B,C), and a special character(@,#,*,&)');
      // print(jsonResponse.toString());
    } else if (jsonResponse['message'] == 'gym not found') {
      Get.snackbar('Error', 'gym does not exist');
      // print(jsonResponse.toString());
    }
    isLoading.value = false;
  }

  Future<void> loginViaFacebook() async {}
  Future<void> loginViaGoogle() async {}
}
