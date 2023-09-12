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

  @override
  void onInit() {
    enableButton();
    registerFormKey = GlobalKey<FormState>(debugLabel: 'Register');
    createBox();
    initSharedPref();

    super.onInit();
  }

  void createBox() async {
    box1 = await Hive.openBox('userData');
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
  void persistData() {
    box1
      ..put('phone', phoneController.text)
      ..put('fullname', nameController.text);
  }

//signup with node js backend
  Future<void> signUp() async {
    var signupBody = {
      'fullName': nameController.text,
      'username': usernameController.text,
      'phone': phoneController.text,
      'password': passwordController.text,
      'gym': gymNameController.text
    };
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

  //signup with firebase
  // Future<void> signUp() async {
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //           email: emailController.text.trim(),
  //           password: passwordController.text.trim(),
  //         )

  //         //add user details to firestore
  //         .then(
  //           (value) => {
  //             postDetailsToFirestore(
  //               phoneController.text,
  //               emailController.text,
  //               nameController.text,
  //               passwordController.text,
  //             )
  //           },
  //         );
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar('Error: ', ' ${e.toString()}');
  //   }
  // }

  // // ignore: always_declare_return_types, inference_failure_on_function_return_type
  // postDetailsToFirestore(
  //   String phoneNo,
  //   String email,
  //   String firstname,
  //   String lastname,
  // ) async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   final userRef = FirebaseDatabase.instance.ref().child('user');
  //   final phoneNoReceiver = phoneController.text;
  //   if (user != null) {
  //     await pref!.setString('user id', user.toString());
  //   }
  //   await userRef.child(user!.uid).set({
  //     'id': user.uid,
  //     'Phone No': '+234$phoneNoReceiver',
  //     'email': emailController.text,
  //     'firstname': firstname,
  //     'lastname': lastname
  //   });

  //   navigateToLoginPage();
  // }

  // DriverPhoneNo = PhoneNoController;
  // currentFirebaseUser = driveruser;

  //   // try {
  //   //   //Validate form
  //   //   registerFormKey.currentState!.save();
  //   //   if (!registerFormKey.currentState!.validate()) {
  //   //     showFlushBar(
  //   //       message: 'Kindly fix validation issues',
  //   //     );
  //   //     return;
  //   //   }
  //   //   viewState = ViewState.busy;

  //   //   final registerDto = RegisterDto(
  //   //     email: emailController.text,
  //   //     phoneNumber: phoneController.text.addCountryCode,
  //   //     fullName: nameController.text,
  //   //     password: passwordController.text,
  //   //   );

  //   //   final res = await AuthApi().createAccount(
  //   //     registerDto: registerDto,
  //   //   );

  //   //   if (res.success) {
  //   //     //store token
  //   //     await storageService.cacheAuthToken(
  //   //       res.payload['token'] as String,
  //   //     );

  //   //     //store user
  //   //     await storageService.cacheCustomer(
  //   //       jsonEncode(res.payload['user']),
  //   //     );
  //   //     showFlushBar(
  //   //       message: res.message ??
  //   //           'Signed up successfully, We have sent a verification code to ${phoneController.text}',
  //   //       errorType: ErrorType.success,
  //   //     );

  //   //     unawaited(
  //   //       Get.toNamed<void>(
  //   //         Routes.verifyPhone,
  //   //       ),
  //   //     );

  //   //     viewState = ViewState.idle;
  //   //   } else {
  //   //     if (res.message == passwordTooWeak) {
  //   //       showFlushBar(
  //   //         message: passwordTooWeak,
  //   //       );
  //   //     }
  //   //     showFlushBar(
  //   //       message: res.message ?? '',
  //   //     );
  //   //     viewState = ViewState.idle;
  //   //   }
  //   //   return;
  //   // } catch (e, s) {
  //   //   log(
  //   //     e.toString(),
  //   //     stackTrace: s,
  //   //   );
  //   //   showFlushBar(
  //   //     message: errorMessage,
  //   //   );
  //   //   viewState = ViewState.idle;
  //   // } finally {
  //   //   viewState = ViewState.idle;
  //   // }
  // }

  Future<void> loginViaFacebook() async {}
  Future<void> loginViaGoogle() async {}
}
