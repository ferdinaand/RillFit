import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class GymController extends BaseController {
  var isLoading = false.obs;
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  late TextEditingController searchController;

  void searchGyms(String? query) {}

  void openDetailsPage() {
    navigationService.navigateTo(
      Routes.gymDetails,
    );
  }

  Future<void> makePayment() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 5));
    // login with node js backend

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
  }
}
