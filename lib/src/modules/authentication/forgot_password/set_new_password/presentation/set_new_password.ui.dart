// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:riilfit/src/data/enum/view_state.enum.dart';
// import 'package:riilfit/src/modules/authentication/forgot_password/set_new_password/controller/set_new_password.controller.dart';
// import 'package:riilfit/src/modules/authentication/forgot_password/set_new_password/presentation/widgets/set_new_password_form.ui.dart';
// import 'package:riilfit/src/presentation/global_widgets/network_loader.ui.dart';
// import 'package:riilfit/src/presentation/resources/res.dart';
// import 'package:riilfit/src/presentation/widgets.dart';

// class ForgotPasswordSetNewPasswordUi
//     extends GetView<ForgotPasswordSetNewPasswordController> {
//   const ForgotPasswordSetNewPasswordUi({super.key});

//   @override
//   ForgotPasswordSetNewPasswordController get controller =>
//       Get.put(ForgotPasswordSetNewPasswordController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () {
//         if (controller.viewState.isBusy) {
//           return const NetworkLoaderUi(
//             message: 'Hold on, setting new password...',
//           );
//         }
//         return GestureDetector(
//           onTap: () {
//             final currentFocus = FocusScope.of(context);
//             if (!currentFocus.hasPrimaryFocus) {
//               currentFocus.unfocus();
//             }
//           },
//           child: Scaffold(
//             appBar: const AuthAppbarUi(),
//             body: SafeArea(
//               child: Padding(
//                 padding: baseViewPadding,
//                 child: CustomScrollView(
//                   slivers: [
//                     SliverFillRemaining(
//                       hasScrollBody: false,
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: const [
//                                 Gap(12),
//                                 TextUi.heading3(
//                                   'Reset Password',
//                                 ),
//                                 Gap(24),
//                                 TextUi.bodyMed(
//                                   'Set a new password for your account so you can login and access all the features in Riilfit App',
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 Gap(24),
//                                 ForgotPasswordSetNewPasswordFormUi(),
//                                 Gap(48),
//                               ],
//                             ),
//                           ),
//                           Obx(
//                             () => PrimaryButtonUi(
//                               text: 'Set new password',
//                               onPressed: controller.isButtonDisabled.value
//                                   ? null
//                                   : controller.setNewPassword,
//                             ),
//                           ),
//                           const Gap(24),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
