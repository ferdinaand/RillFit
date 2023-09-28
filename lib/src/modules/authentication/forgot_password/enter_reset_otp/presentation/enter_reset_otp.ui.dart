// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:riilfit/src/data/enum/view_state.enum.dart';
// import 'package:riilfit/src/modules/authentication/forgot_password/enter_reset_otp/controller/enter_reset_otp.controller.dart';
// import 'package:riilfit/src/presentation/global_widgets/pin_fields.ui.dart';
// import 'package:riilfit/src/presentation/resources/res.dart';
// import 'package:riilfit/src/presentation/widgets.dart';

// class ForgotPasswordEnterResetOtpUi
//     extends GetView<ForgotPasswordEnterResetOtpController> {
//   const ForgotPasswordEnterResetOtpUi({super.key});

//   @override
//   ForgotPasswordEnterResetOtpController get controller =>
//       Get.put(ForgotPasswordEnterResetOtpController());

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         final currentFocus = FocusScope.of(context);
//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//       },
//       child: Scaffold(
//         appBar: const AuthAppbarUi(),
//         body: SafeArea(
//           child: Padding(
//             padding: baseViewPadding,
//             child: CustomScrollView(
//               slivers: [
//                 SliverFillRemaining(
//                   hasScrollBody: false,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Gap(12),
//                             const TextUi.heading3(
//                               'Forgot Password',
//                             ),
//                             const Gap(24),
//                             const TextUi.bodyMed(
//                               'Enter the 6-digit recovery code sent to',
//                               textAlign: TextAlign.center,
//                             ),
//                             const Gap(4),
//                             TextUi.bodyMed(
//                               controller.userEmail,
//                               textAlign: TextAlign.center,
//                               color: primary,
//                               fontWeight: mediumText,
//                             ),
//                             const Gap(24),
//                             PinFieldUi(
//                               controller: controller.pinController,
//                               onChanged: (_) {
//                                 controller.enableButton();
//                               },
//                             ),
//                             const Gap(48),
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: controller.resendCode,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 4),
//                           child: Obx(
//                             () => TextUi.bodyMed(
//                               'Resend recovery code',
//                               color: controller.themeService.isDarkMode
//                                   ? grayScale100
//                                   : grayScale700,
//                               fontWeight: mediumText,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Gap(24),
//                       Obx(
//                         () => PrimaryButtonUi(
//                           text: 'Verify code',
//                           loading: controller.viewState.isBusy,
//                           onPressed: controller.isButtonDisabled.value
//                               ? null
//                               : controller.verifyRecoveryCode,
//                         ),
//                       ),
//                       const Gap(24),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
