// ignore_for_file: omit_local_variable_types, require_trailing_commas, avoid_void_async, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:riilfit/src/data/Models/gym.plans.models.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/utils/config.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';
import 'package:mono_flutter/mono_flutter.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:http/http.dart' as http;
import '../../../../../data/Models/notificationModel.dart';
import '../../../../../routing/app_pages.dart';
import 'dart:async';
import 'dart:convert';

class GymPlansController extends BaseController {
  final iD = ''.obs;
  final isLoading = false.obs;
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  var fullname = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var userName = ''.obs;

//   String flutterWaveTest = '''
//  <form method="POST" action="https://checkout.flutterwave.com/v3/hosted/pay">
//   <div>
//     Your order is N10
//   </div>
//   <input type="hidden" name="public_key" value="FLWPUBK-58cc63c00e129204fb4e94ef95bb781f-X" />
//   <input type="hidden" name="customer[email]" value="jessepinkman@walterwhite.org" />
//   <input type="hidden" name="customer[name]" value="${fullname.value}" />
//   <input type="hidden" name="tx_ref" value="bitethtx-019203" />
//   <input type="hidden" name="amount" value="10" />
//   <input type="hidden" name="currency" value="NGN" />
//   <input type="hidden" name="meta[token]" value="54" />
//   <input type="hidden" name="redirect_url" value="https://riilfit-api.vercel.app/debit-cards/new/?userId= " />
//    <input type="hidden" name="payment_options" value="card" />
//   <button type="submit" id="start-payment-button">Pay Now</button>

// </form> ''';

  void getPlanId() {}

  void gymsInLocation() {
    navigationService.navigateTo(
      Routes.gym,
    );
  }

  // final socketService = Get.find<SocketService>();
  @override
  void onInit() {
//  Set up the notification listener
    // socketService.socket!.on('notifications:alert', (data) {
    //   // Handle the received notification data
    //   // Display notification using Get.snackbar or other methods
    //   if (data is Map<String, dynamic>) {
    //     final notificationData = NotificationData.fromJson(data);
    //     // final title = data['title'];
    //     // final summary = data['summary'];
    //     print(notificationData.summary);
    //   }
    // });

    // Call fetchUserData here when the HomeController is initialized
    fetchGymPlans();
    fetchUserData();
    super.onInit();
  }

  void tag() {
    navigationService.navigateTo(
      Routes.gymTag,
    );
  }

  final planController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  final Controller = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final cardNumberController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final cardNameController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final cardYearController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final cardMonthController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final cardCvvController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
//   final planController = TextEditingController(
//     text: kDebugMode ? '' : null,
//   );

// final planController = TextEditingController(
//     text: kDebugMode ? '' : null,
//   );
  final isButtonDisabled = true.obs;
  var thisGymPlans = <gymPlans>[].obs;
  var isGymPlanLoading = false.obs;

  void enableButton() {
    isButtonDisabled.value == planController.text.isEmpty;
    return;
  }

  void handlePayment(BuildContext context) async {
    // MonoFlutter().launch(
    //   context,
    //   'test_pk_ku8af8e0gc6hibayqx5b',

    //   // reAuthCode: 'code_7ZSg9UB0sZsMSL3ygb6X',
    //   reference: DateTime.now().millisecondsSinceEpoch.toString(),
    //   config: {
    //     "selectedInstitution": {
    //       "id": "5f2d08bf60b92e2888287703",
    //       "auth_method": "internet_banking"
    //     }
    //   },
    //   onEvent: (event, data) {
    //     if (kDebugMode) print('event: $event, data: $data');
    //   },
    //   onClosed: () {
    //     if (kDebugMode) print('Modal closed');
    //   },
    //   onLoad: () {
    //     if (kDebugMode) print('Mono loaded successfully');
    //   },
    //   onSuccess: (code) {
    //     if (kDebugMode) print('Mono Success $code');
    //     getGymQr();
    //   },
    // );
  }

  //select a city when clicked
  final RxString selectedPlanId = ''.obs;

  final RxString selectedPlanPrice = ''.obs;

  final RxString selectedPlanType = ''.obs;

  final RxString subscribersName = ''.obs;

  void setSelectedPlan(
      String plan, String price, String type, String subscriberName) {
    selectedPlanId.value = plan;
    selectedPlanPrice.value = price;
    selectedPlanType.value = type;
    subscribersName.value = subscriberName;
  }

  Future<void> fetchGymPlans() async {
    isGymPlanLoading(true);

    await Future.delayed(Duration(seconds: 5));
    try {
      print('getting plans');

      final box = await Hive.openBox('userData');
      final token = box.get('token', defaultValue: '');
      final Id = box.get('selectedGymId', defaultValue: '');
      print(token);
      print(Id);
      final response = await http.get(
        Uri.parse('https://riilfit-api.vercel.app/gyms/$Id/plans'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isGymPlanLoading(false);
      // print(response.body);
      // isLoading.value = false;
      final jsonResponse = jsonDecode(response.body);
      String message = jsonResponse['message'].toString();
      if (response.statusCode == 200) {
        final data = jsonResponse['data']['items'];
        thisGymPlans.clear();
        print(data);

        // print(data);

        for (final item in data as List<dynamic>) {
          // print("3333");
          // print(data);
          final id = item['_id'] as String;
          final visitsPerMonth = item['features']['visitsPerMonth'];
          final description = item['description'] as String;
          final category = item['category'] as String;
          final amount = item['amount'];
          final openingTime =
              item['features']['accessPeriod']['start'] as String;
          final closingTime = item['features']['accessPeriod']['end'] as String;

          print('44444');
          print(amount);
          print(category);
          print(description);
          print(closingTime);
          print(id);

          // print(logo);

          final gymplans = gymPlans(
              id: id,
              amount: amount.toString(),
              category: category,
              description: description,
              openingTime: openingTime,
              closingTime: closingTime,
              visitsPerMonth: visitsPerMonth.toString(),
              priviledges: '');
          thisGymPlans.add(gymplans);

          // thisGymList.value = gymList;

          // print('555555');
          // print(_gymList);
        }
//       locationList.value = data.
// //map((e) => GymLocations.fromJson(e)).toList();

        update();
      } else {
        print(jsonResponse['message']);
        isGymPlanLoading(false);
        if (message == 'no BEARER authorization header provided') {
          Get..snackbar('', '$message', backgroundColor: errorLight);
          Get.offAndToNamed(Routes.login);
        } else if (message == 'you are not registered with this gym') {
          Get..snackbar('', '$message', backgroundColor: errorLight);
          Get.back();
        } else {
          Get.offAndToNamed(Routes.login);
        }
        //
      }
    } catch (e) {
      Get.snackbar('error', '$e', backgroundColor: errorDark);
    }
    isGymPlanLoading(false);
  }

//++
  Future<void> fetchUserData() async {
    final userDataBox = await Hive.openBox('userData');
    final fullName = userDataBox.get('fullname', defaultValue: '');
    final username = userDataBox.get('username', defaultValue: '');
    final phoneNumber = userDataBox.get('phone', defaultValue: '');
    final token = userDataBox.get('token', defaultValue: '');
    final id = userDataBox.get('userId', defaultValue: '');
    print(id);
    // Update the observable variables
    fullname.value = fullName.toString();
    userName.value = username.toString();
    iD.value = id.toString();
    this.phoneNumber.value = phoneNumber.toString();

    // await userDataBox.close();
  }

  Future<void> getGymQr() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 5));

    navigationService.navigateTo(
      Routes.gymTag,
    );
    isLoading.value = false;
    // var signupBody = {
    //   "fullName": '',
    //   "gymName": '',
    //   "gymPhone": '',
    //   "logoUrl":
    //       "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80",
    //   "username": '',
    //   "password": ''
    // };

    // var response = await http.post(
    //     Uri.parse('https://riilfit-backend.vercel.app/auth/login'),
    //     headers: {"Content-Type": "application/json"},
    //     body: jsonEncode(signupBody));

    // final jsonResponse = jsonDecode(response.body);
    // return jsonResponse;
  }

  Future<void> performDebitCardCharge() async {
    try {
      // Prepare the request data
      final requestBody = {
        "tx_ref": DateFormat('yyyy-MM-dd kk:mm:ss a').format(DateTime.now()),
        "card_number": cardNumberController.text,
        "cvv": cardCvvController.text,
        "expiry_month": cardMonthController.text,
        "expiry_year":
            cardYearController.text, // Replace with your transaction reference
        "amount": 100, // Replace with the amount you want to charge (in kobo)
        "currency": "NGN", // Replace with the desired currency code

        "redirect_url":
            "https://riilfit-api.vercel.app/debit-cards/new/?userId=$iD", // Replace with your redirect URL

        "email": "customer@example.com", // Replace with customer's email
        "fullname": cardNameController.text, // Replace with customer's name
        // Add other customer details as needed

        // Add other required parameters as needed
      };

      print(111111);
      final response = await http.post(
        Uri.parse('https://api.flutterwave.com/v3/charges?type=card'),
        headers: {
          'Authorization':
              'Bearer FLWPUBK_TEST-dd5ad6338e5b0ba65dcf0ae9481d0792-X', // Replace with your Flutterwave API key
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Charge request successful, parse the response
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        // final chargeResponse = ChargeResponse.fromJson(jsonResponse);

        // Handle the charge response as needed
        // print(chargeResponse);

        // Redirect the user to the Flutterwave payment page using the chargeResponse.data.link
        // You can use a WebView or open the link in the user's browser
      } else {
        // Handle error response
        print('Charge request failed: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }
}
