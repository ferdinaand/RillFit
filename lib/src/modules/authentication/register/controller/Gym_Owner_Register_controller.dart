// ignore_for_file: prefer_single_quotes, prefer_final_locals

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

bool routeFromUserSignin = false;

class GymOwnerRegisterController extends BaseController {
  late GlobalKey<FormState> loginFormKey;
  SharedPreferences? pref;
  var isLoading = false.obs;
  String imageUrl = '';
  XFile? file;
  @override
  void onInit() {
    enableButton();
    loginFormKey = GlobalKey<FormState>(debugLabel: 'Login');
    initSharedPref();
    super.onInit();
  }

  void initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }

  //text field controllers
  final emailOrPhoneController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final fullnameController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final gymStateController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final gymCityController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final gymAddressController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final gymNameController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  final usernameController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final passwordController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final phoneController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  void selectImage() async {
    //select image using image picker package
    ImagePicker imagePicker = ImagePicker();
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');
  }

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value = emailOrPhoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phoneController.text.isEmpty ||
        fullnameController.text.isEmpty ||
        gymStateController.text.isEmpty ||
        gymCityController.text.isEmpty ||
        gymAddressController.text.isEmpty ||
        usernameController.text.isEmpty ||
        gymNameController.text.isEmpty;

    return;
  }

  void navigateToRegisterPage() {
    routeFromUserSignin = true;
    Get.offAndToNamed<void>(
      Routes.register,
    );
  }

  Future<void> signup() async {
    // login with node js backend
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 3));
    //save the image to firebase storage
    if (file == null) {
      Get.snackbar('logo error', 'no logo selected');

      return;
    }
    Reference root = FirebaseStorage.instance.ref();
    Reference DirGymLogo = root.child('gymLogo');

    //parsing the gym logo to be uploaded to the reference

    Reference gymLogoUpload = DirGymLogo.child(gymNameController.text);

    try {
      await gymLogoUpload.putFile(File(file!.path));

      imageUrl = await gymLogoUpload.getDownloadURL();
      print('${imageUrl}');
    } catch (e) {}

    var signupBody = {
      "fullName": fullnameController.text,
      "gymName": gymNameController.text,
      "gymPhone": phoneController.text,
      "locations": [
        {
          "state": gymStateController.text,
          "city": gymCityController.text,
          "address": gymAddressController.text,
        }
      ],
      "logoUrl": imageUrl,
      "username": usernameController.text,
      "password": passwordController.text
    };
    print(signupBody);

    var response = await http.post(
        Uri.parse('https://riilfit-api.vercel.app/auth/gym-owners/signup'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(signupBody));

    var jsonResponse = jsonDecode(response.body);

    print(jsonResponse);
    if (jsonResponse['access_token'] != null) {
      Get.snackbar('success', 'Registered in successfully');
      final token = jsonResponse;
      if (token != null) {
        await pref?.setString('token', token.toString());
      }

      await Get.offAllNamed<void>(
        Routes.gymOwnerLogin,
      );
    } else if (jsonResponse['message'] == 'please provide strong password') {
      Get.snackbar('please provide strong password',
          'password must contain 8+ characters, an uppercase(A,B,C), and a special character(@,#,*,&)');
      // print(jsonResponse.toString());
    } else if (jsonResponse['message'] == 'gym not found') {
      Get.snackbar('Error', 'gym not found');
      // print(jsonResponse.toString());
    } else if (jsonResponse['message'] == 'invalid phone number provided') {
      Get.snackbar('Error', 'invalid phone number');
      // print(jsonResponse.toString());
    }
    isLoading.value = false;

//login with firebase
    //   try {
    //     await FirebaseAuth.instance.signInWithEmailAndPassword(
    //         email: emailOrPhoneController.text,
    //         password: passwordController.text);

    //     await Get.offAllNamed<void>(
    //       Routes.app,
    //     );
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'user-not-found') {
    //       Get.snackbar('no user', 'No user found for that email');
    //     } else if (e.code == 'wrong-password') {
    //       Get.snackbar('wrong password', 'wrong password provided for that user');
    //     } else if (e.code == 'network-request-failed') {
    //       Get.snackbar(
    //           'Network error', 'please check your connection and try again');
    //     }
    //   }
    // }

    // try {
    //   //Validate form
    //   loginFormKey.currentState!.save();
    //   if (!loginFormKey.currentState!.validate()) {
    //     showFlushBar(
    //       message: 'Kindly fix validation issues',
    //     );
    //     return;
    //   }
    //   viewState = ViewState.busy;

    //   final loginDto = LoginDto(
    //     emailPhone: emailOrPhoneController.text,
    //     password: passwordController.text,
    //   );

    //   final res = await AuthApi().login(
    //     loginDto: loginDto,
    //   );

    //   if (res.success) {
    //     //store token
    //     await storageService.cacheAuthToken(
    //       res.payload['token'] as String,
    //     );

    //     //store user
    //     await storageService.cacheCustomer(
    //       jsonEncode(res.payload['user']),
    //     );

    //     unawaited(
    //       Get.offAllNamed<void>(
    //         Routes.app,
    //       ),
    //     );
    //     viewState = ViewState.idle;
    //   } else {
    //     showFlushBar(
    //       message: res.message ?? errorMessage,
    //     );
    //     viewState = ViewState.idle;
    //   }
    // } on SocketException catch (e, s) {
    //   print('SOCKETEXECPTION');
    //   log(
    //     e.toString(),
    //     stackTrace: s,
    //   );
    //   showFlushBar(
    //     message: errorMessage,
    //   );
    //   viewState = ViewState.idle;
    // } catch (e, s) {
    //   log(
    //     e.toString(),
    //     stackTrace: s,
    //   );
    //   showFlushBar(
    //     message: errorMessage,
    //   );
    //   viewState = ViewState.idle;
    // } finally {
    //   viewState = ViewState.idle;
    // }

    Future<void> loginViaFacebook() async {}
    Future<void> loginViaGoogle() async {}

    void navigateToForgotPassword() {
      Get.toNamed<void>(
        Routes.forgotPasswordInit,
      );
    }
  }
}
