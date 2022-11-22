import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/register/presentation/register.ui.dart';
import 'package:riilfit/src/presentation/views.dart';
import 'package:riilfit/src/routing/guards/app_guard.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.onboarding;

  static final unknownRoute = GetPage(
    name: Routes.page404,
    page: () => const UnknownPageUi(),
  );

  static final pages = [
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingUi(),
      middlewares: [
        AppGuard(),
      ],
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginUi(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterUi(),
    ),
    GetPage(
      name: Routes.forgotPasswordInit,
      page: () => const ForgotPasswordEnterEmailUi(),
    ),
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
