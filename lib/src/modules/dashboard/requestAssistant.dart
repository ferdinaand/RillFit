// ignore_for_file: unused_import

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:BUswift/screens/driver_screens/signup_screen.dart';

class RequestAssistant {
  static Future<dynamic> getRequest(dynamic urL,
      {List<Map<String, String>>? headers}) async {
    http.Response response = await http.get(
      Uri.parse(urL),
    );

    try {
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var decodeData = jsonDecode(jsonData);
        return decodeData;
      } else {
        return "failed";
      }
    } catch (e) {
      return "failed";
    }
  }
}
