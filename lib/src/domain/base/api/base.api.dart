// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:riilfit/src/domain/services/storage.service.dart';
// import 'package:riilfit/src/presentation/resources/strings.res.dart';

// Dio connect() {
//   final storageService = Get.find<StorageService>();

//   final options = BaseOptions(
//     baseUrl: apiBaseUrl,
//     connectTimeout: 60000,
//     receiveTimeout: 60000,
//   );
//   final dio = Dio(options);

//   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//       (HttpClient client) {
//     client.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;
//     return client;
//   };

//   dio.interceptors.add(
//     InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         final value = await storageService.fetchAuthToken();
//         debugPrint(options.uri.toString());
//         debugPrint(options.data.toString());
//         debugPrint(value.toString());
//         if (value != null) {
//           options.headers['Authorization'] = value;
//         }
//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         debugPrint(response.data.toString());
//         return handler.next(response);
//       },
//       onError: (DioError e, handler) {
//         if (e.type == DioErrorType.response) {
//           //response error or backend error
//           //log error response and stacktrace
//           log(
//             e.response?.statusCode?.toString() ?? '',
//             stackTrace: e.stackTrace,
//           );
//           log(
//             e.response?.data?.toString() ?? '',
//             stackTrace: e.stackTrace,
//           );

//           if (e.response!.statusCode == 401) {
//             //UnAuthorised, send user out
//             //Might not be needed anyways sha

//             return handler.next(e);
//           }
//         }
//         if (e.type == DioErrorType.connectTimeout ||
//             e.type == DioErrorType.receiveTimeout ||
//             e.type == DioErrorType.sendTimeout ||
//             e.error is SocketException) {
//           //internet-related error
//           throw const SocketException(networkError);
//         }

//         return handler.next(e);
//       },
//     ),
//   );

//   return dio;
// }
