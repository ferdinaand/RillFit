part of 'app_pages.dart';

/// Contains all routes used in the app
/// All routes must start with a backslash [\]
abstract class Routes {
  static const page404 = '/404';
  static const home = '/app/home';
  static const app = '/app';
  static const login = '/login';
  static const register = '/register';
  static const verifyPhone = '/verify-phone';
  static const onboarding = '/onboarding';
  static const forgotPasswordInit = '/forgot-password/enter-email';
  static const forgotPasswordEnterOtp = '/forgot-password/enter-otp';
  static const forgotPasswordSetNewPassword =
      '/forgot-password/set-new-password';
}
