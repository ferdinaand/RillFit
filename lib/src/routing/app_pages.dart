import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/register/presentation/register.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_details/presentation/gym_details.ui.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/presentation/gym.ui.dart';
import 'package:riilfit/src/modules/dashboard/stores/presentation/stores.ui.dart';
import 'package:riilfit/src/modules/dashboard/train/presentation/train.ui.dart';
import 'package:riilfit/src/modules/dashboard/train/trainer_details/presentation/trainer.details.dart';
import 'package:riilfit/src/presentation/layouts/dashboard.layout.dart';
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
    GetPage(
      name: Routes.forgotPasswordEnterOtp,
      page: () => const ForgotPasswordEnterResetOtpUi(),
    ),
    GetPage(
      name: Routes.forgotPasswordSetNewPassword,
      page: () => const ForgotPasswordSetNewPasswordUi(),
    ),
    GetPage(
      name: Routes.verifyPhone,
      page: () => const VerifyPhoneUi(),
    ),
    GetPage(
      name: Routes.app,
      page: () => const DashboardManager(),
    ),
    GetPage(
      name: Routes.gym,
      page: () => const GymUi(),
    ),
    GetPage(
      name: Routes.stores,
      page: () => const StoresUi(),
    ),
    GetPage(
      name: Routes.train,
      page: () => const TrainUi(),
    ),
    GetPage(
      name: Routes.gymDetails,
      page: () => const GymDetailsUi(),
    ),
    GetPage(
      name: Routes.trainersDetails,
      page: () => const TrainerDetailsUi(),
    ),
  ];
}
