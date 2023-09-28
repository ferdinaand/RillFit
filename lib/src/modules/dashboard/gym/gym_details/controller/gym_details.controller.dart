import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../../../data/Models/GymDetails.dart';
import '../../../../../routing/app_pages.dart';

class GymDetailsController extends BaseController {
  final _currentIndex = 0.obs;
  var isLoading = false.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  Rx<gymDetails> thisGymDetails = gymDetails().obs;

  void openGymPlans() {
    navigationService.navigateTo(
      Routes.gymPlan,
    );
  }

  void UpdateGymDetails() {}

  Future<void> makePayment() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 5));
    openGymPlans();
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
