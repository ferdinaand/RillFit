import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:http/http.dart' as http;
import '../../../../../routing/app_pages.dart';
import 'dart:async';
import 'dart:convert';

class GymPlansController extends BaseController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  void gymsInLocation() {
    navigationService.navigateTo(
      Routes.gym,
    );
  }

  Future<void> getGymPlans() async {
    var signupBody = {
      "fullName": '',
      "gymName": '',
      "gymPhone": '',
      "logoUrl":
          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80",
      "username": '',
      "password": ''
    };

    var response = await http.post(
        Uri.parse('https://riilfit-backend.vercel.app/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(signupBody));

    final jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }
}
