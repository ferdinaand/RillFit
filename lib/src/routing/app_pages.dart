import 'package:get/get.dart';

import '../modules/onboarding/presentation/onboarding.ui.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.onboarding;

  static final pages = [
    GetPage(
      name: Routes.onboarding,
      page: () => const OnBoardingUi(),
      // middlewares: [
      //   AppGuard(),
      // ],
    ),
    // GetPage(
    //   name: Routes.login,
    //   page: () => const LoginUi(),
    // ),
    // GetPage(
    //   name: Routes.register,
    //   page: () => const RegisterUi(),
    // ),
    // GetPage(
    //   name: Routes.createPin,
    //   page: () => const CreatePinUi(),
    // ),
    // GetPage(
    //   name: Routes.otpAuth,
    //   page: () => const OTPAuthUi(),
    // ),
    // GetPage(
    //   name: Routes.forgotPassword,
    //   page: () => const ForgotPassordUi(),
    // ),
    // GetPage(
    //   name: Routes.selectCountry,
    //   page: () => const SelectCountryUi(),
    // ),
    // GetPage(
    //   name: Routes.onboardingCompleted,
    //   page: () => const OnboardingCompletedUi(),
    // ),
    // GetPage(
    //   name: Routes.home,
    //   page: () => const HomeUi(),
    // ),
    // GetPage(
    //   name: Routes.loginWithPin,
    //   page: () => const LoginInWithPINUi(),
    // ),
  ];
}
