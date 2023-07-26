part of 'app_pages.dart';

/// Contains all routes used in the app
/// All routes must start with a backslash [\]
abstract class Routes {
  static const page404 = '/app/404';
  static const home = '/app/home';
  static const app = '/app';
  static const gym = '/app/gym';
  static const gymDetails = '/app/gym-details';
  static const train = '/app/train';
  static const trainersDetails = '/app/trainer-details';
  static const muscleGroupCat = '/app/muscleGroupCat';
  static const workoutForceCat = '/app/workoutForceCat';
  static const equipmentCat = '/app/equipmentCat';
  static const stores = '/app/stores';
  static const login = '/app/login';
  static const register = '/app/register';
  static const verifyPhone = '/app/verify-phone';
  static const onboarding = '/app/onboarding';
  static const forgotPasswordInit = '/app/forgot-password/enter-email';
  static const forgotPasswordEnterOtp = '/app/forgot-password/enter-otp';
  static const forgotPasswordSetNewPassword =
      '/app/forgot-password/set-new-password';
  static const profile = '/app/ProfileUi';
  static const trainingContent = '/app/trainingContent';
  static const chooseRole = '/app/chooseRole';
  static const selectLocation = '/app/selectLocation';
  static const gymOwnerRegister = '/app/gymOwnerRegister';
  static const gymProfile = '/app/gymProfile';
  static const gymTag = '/app/gymTag';
  static const gymPlan = '/app/gymPlan';
  static const gymOwnerLogin = '/app/gymOwnerLogin';
}
