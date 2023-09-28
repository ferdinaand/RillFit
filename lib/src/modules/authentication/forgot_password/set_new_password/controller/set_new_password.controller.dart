// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:riilfit/src/data/enum/error_type.enum.dart';
// import 'package:riilfit/src/data/enum/view_state.enum.dart';
// import 'package:riilfit/src/domain/api/auth/auth.api.dart';
// import 'package:riilfit/src/domain/base/controller/base.controller.dart';
// import 'package:riilfit/src/presentation/resources/strings.res.dart';
// import 'package:riilfit/src/presentation/utility/flushbar/show-flushbar.helper.dart';
// import 'package:riilfit/src/routing/app_pages.dart';
// // import 'package:riilfit/src/data/remote_data_source/other_services/auth_repositories.dart';

// class ForgotPasswordSetNewPasswordController extends BaseController {
//   late GlobalKey<FormState> setNewPasswordFormKey;
//   // final AuthRepositories _repositories = AuthRepositories();
//   @override
//   @override
//   void onInit() {
//     enableButton();
//     setNewPasswordFormKey = GlobalKey<FormState>(
//       debugLabel: 'set new password forgot password flow',
//     );
//     super.onInit();
//   }

//   //text field controllers
//   final newPasswordController = TextEditingController(
//     text: kDebugMode ? 'Riilfit123!@#' : null,
//   );

//   final confirmNewPasswordController = TextEditingController(
//     text: kDebugMode ? 'Riilfit123!@#' : null,
//   );

//   //Enable and disable button logic
//   final isButtonDisabled = true.obs;

//   void enableButton() {
//     isButtonDisabled.value = newPasswordController.text.isEmpty ||
//         confirmNewPasswordController.text.isEmpty;

//     return;
//   }

//   Future<void> setNewPassword() async {
//     try {
//       //Validate form
//       setNewPasswordFormKey.currentState!.save();
//       if (!setNewPasswordFormKey.currentState!.validate()) {
//         if (newPasswordController.text != confirmNewPasswordController.text) {
//           showFlushBar(message: "Passwords don't match");
//           return;
//         }

//         showFlushBar(
//           message: 'Kindly fix all validation issues',
//         );
//         return;
//       }

//       viewState = ViewState.busy;

//       final res = await AuthApi().finishResetPassword(
//         newPassword: newPasswordController.text,
//       );

//       if (res.success) {
//         showFlushBar(
//           message: passwordResetSuccessfulMessage,
//           errorType: ErrorType.success,
//         );

//         await Future<void>.delayed(const Duration(seconds: 1));

//         Get.until(
//           (route) => Get.currentRoute == Routes.login,
//         );
//         viewState = ViewState.idle;
//       } else {
//         showFlushBar(
//           message: res.message ?? errorMessage,
//         );
//         viewState = ViewState.idle;
//       }
//       return;
//     } catch (e, s) {
//       log(
//         e.toString(),
//         stackTrace: s,
//       );
//       showFlushBar(
//         message: errorMessage,
//       );
//       viewState = ViewState.idle;
//     } finally {
//       viewState = ViewState.idle;
//     }
//   }
// }
