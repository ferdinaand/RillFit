// // ignore_for_file: unused_local_variable, unused_import, camel_case_types, non_constant_identifier_names, avoid_print

// import 'dart:convert';
// import 'dart:math';

// import 'package:BUswift/Assistant/Geofire_assistant.dart';
// import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_geofire/flutter_geofire.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:BUswift/Assistant/requestAssistant.dart';
// import 'package:BUswift/Data%20Handler/AppData.dart';
// import 'package:BUswift/Models/Address.dart';
// import 'package:BUswift/Models/directDetails.dart';
// import 'package:BUswift/constants.dart';
// import 'package:BUswift/screens/driver_screens/signup_screen.dart';
// import 'package:http/http.dart' as http;

// import '../Models/allusers.dart';

// class assistandMethods {
//   static Future<String> searchCoordinateAddress(
//       Position position, context) async {
//     String placeAddress = "";
//     String st1, st2, st3;
//     String url =
//         "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$google_api_key"; //get the address from the reverse geocoding api manager platform and attach your apikey to it and change LAt and lng to ${position.lat} and ${position.lng}
//     try {
//       var response = await RequestAssistant.getRequest(url);

//       if (response != "failed") {
//         st1 = response["results"][0]["address_components"][1]['long_name'];

//         st2 = response["results"][0]["address_components"][4]['long_name'];
//         st3 = response["results"][0]["address_components"][5]['long_name'];

//         placeAddress = st1 + ", " + st2 + ", " + st3;
//         debugPrint(placeAddress);
//         Address userPickUpAddress = Address();
//         userPickUpAddress.PlaceName = placeAddress;
//         userPickUpAddress.Longitude = position.longitude;
//         userPickUpAddress.Latitude = position.latitude;

//         Provider.of<AppData>(context, listen: false)
//             .updatePickUpLocationAddress(userPickUpAddress);
//       }
//     } catch (e) {
//       displayToastMessage("network Error..", context);
//     }
//     return placeAddress;
//   }

//   static Future<directDetails?> obtainPlaceDirectionDetails(
//     LatLng initialPosition,
//     LatLng finalPosition,
//   ) async {
//     String directionUrl =
//         "https://api.mapbox.com/directions/v5/mapbox/driving/${initialPosition.longitude},${initialPosition.latitude};${finalPosition.longitude},${finalPosition.latitude}?alternatives=false&annotations=distance%2Cduration&continue_straight=false&geometries=polyline&overview=full&steps=false&access_token=pk.eyJ1IjoiZWtwbzU0NiIsImEiOiJjbGExM2JrY2swMTNzM3BwZHJ4OGRsZzRlIn0.jmHhkTJEWfDuBoVryFOgEg";

//     var res = await RequestAssistant.getRequest(directionUrl);

//     if (res != "failed") {
//       directDetails _directDetails = directDetails();
//       _directDetails.encodedpoints = res['routes'][0]["geometry"];
//       _directDetails.distance = res['routes'][0]["distance"];
//       _directDetails.duration = res['routes'][0]["duration"];

//       return _directDetails;
//     }
//   }

//   static calculateRideFare(directDetails _directDetails) {
//     double timeTravelledFare = (_directDetails.duration / 60) * 100;
//     double distanceTravelledFare = (_directDetails.distance / 1000) * 100;
//     double totalFare = timeTravelledFare + distanceTravelledFare;

//     return totalFare.truncate();
//   }

//   static void getCurrentOnlineUserInfo() async {
//     rideruser = FirebaseAuth.instance.currentUser;
//     String userId = rideruser!.uid;
//     DatabaseReference reference =
//         FirebaseDatabase.instance.ref().child('client').child(userId);

//     reference.once().then((event) {
//       final snap = event.snapshot;
//       if (snap.value != null) {
//         userCurrentInfo = Users.fromSnapshot(snap);
//       }
//     });
//   }
// // static void getAllUserInfo() async {

// //     DatabaseReference reference =
// //         FirebaseDatabase.instance.ref().child('AllUser').

// //   }

//   static double createRandomnumber(int num) {
//     var random = Random();
//     int radNum = random.nextInt(num);

//     return radNum.toDouble();
//   }

//   static void disableDriverMapLiveLocationUpdates() {
//     mapScreenStreamSub?.pause();
//     Geofire.removeLocation(currentFirebaseUser!.uid);
//   }

//   static void enaableDriverMapLiveLocationUpdates() {
//     mapScreenStreamSub?.resume();
//     Geofire.setLocation(currentFirebaseUser!.uid, currentPosition.latitude,
//         currentPosition.longitude);
//   }

//   static sendNotificationToDriver(
//       String token, context, String ride_request_id) async {
//     var destination =
//         Provider.of<AppData>(context, listen: false).dropOffLocation;

//     Map<String, String> hearderMap = {
//       'Content-Type': 'application/json',
//       'Authorization': serverKey,
//     };

//     Map<String, dynamic> notificationMap = {
//       'body': 'dropOff Address, ${destination!.name}',
//       'title': 'New Ride Request',
//     };

//     Map<String, dynamic> dataMap = {
//       'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//       'id': '1',
//       'status': 'done',
//       'ride_request_id': ride_request_id
//     };
//     Map sendNotificationMap = {
//       'notification': notificationMap,
//       'data': dataMap,
//       'priority': "high",
//       'to': token
//     };
//     var res = await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         headers: hearderMap, body: jsonEncode(sendNotificationMap));
//     print(res.toString());
//   }
// }
