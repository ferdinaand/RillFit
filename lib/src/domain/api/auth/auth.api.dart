// import 'package:dio/dio.dart';
// import 'package:riilfit/src/data/dtos/base/base.dto.dart';
// import 'package:riilfit/src/data/dtos/dto.dart';
// import 'package:riilfit/src/domain/base/api/base.api.dart';

// class AuthApi {
//   Future<BaseDto> createAccount({
//     required RegisterDto registerDto,
//   }) async {
//     try {
//       final response = await connect().post<String>(
//         '/auth/register',
//         data: registerDto.toString(),
//       );

//       return baseDtoFromJson(response.data!);
//     } on DioError catch (e) {
//       return baseDtoFromJson(e.response?.data as String? ?? '');
//     }
//   }

//   Future<BaseDto> login({
//     required LoginDto loginDto,
//   }) async {
//     try {
//       final response = await connect().post<String>(
//         '/auth/login',
//         data: loginDto.toString(),
//       );

//       return baseDtoFromJson(response.data!);
//     } on DioError catch (e) {
//       return baseDtoFromJson(e.response?.data as String? ?? '');
//     }
//   }

//   Future<BaseDto> initPhoneVerification({
//     required String email,
//   }) async {
//     try {
//       final response = await connect().post<String>(
//         '/sms/initiate-verification',
//         data: {
//           'email': email,
//         },
//       );

//       return baseDtoFromJson(response.data!);
//     } on DioError catch (e) {
//       return baseDtoFromJson(e.response?.data as String? ?? '');
//     }
//   }

//   Future<BaseDto> verifyPhone({
//     required String code,
//   }) async {
//     try {
//       final response = await connect().post<String>(
//         '/sms/check-verification-code',
//         data: {
//           'code': code,
//         },
//       );

//       return baseDtoFromJson(response.data!);
//     } on DioError catch (e) {
//       return baseDtoFromJson(e.response?.data as String? ?? '');
//     }
//   }

//   Future<BaseDto> initResetPassword({
//     required String email,
//   }) async {
//     try {
//       final response = await connect().post<String>(
//         '/user/initResetPassword',
//         data: {
//           'email': email,
//         },
//       );

//       return baseDtoFromJson(response.data!);
//     } on DioError catch (e) {
//       return baseDtoFromJson(e.response?.data as String? ?? '');
//     }
//   }

//   Future<BaseDto> verifyResetCode({
//     required ResetPasswordDto resetPasswordDto,
//   }) async {
//     try {
//       final response = await connect().post<String>(
//         '/user/finishResetPassword',
//         data: resetPasswordDto.toString(),
//       );

//       return baseDtoFromJson(response.data!);
//     } on DioError catch (e) {
//       return baseDtoFromJson(e.response?.data as String? ?? '');
//     }
//   }

//   Future<BaseDto> finishResetPassword({
//     required String newPassword,
//   }) async {
//     try {
//       final response = await connect().post<String>(
//         '/user/resetPassword',
//         data: {
//           'newPassword': newPassword,
//         },
//       );

//       return baseDtoFromJson(response.data!);
//     } on DioError catch (e) {
//       return baseDtoFromJson(e.response?.data as String? ?? '');
//     }
//   }

//   Future<BaseDto> logout() async {
//     try {
//       final response = await connect().post<String>(
//         '/user/logout',
//       );

//       return baseDtoFromJson(response.data!);
//     } on DioError catch (e) {
//       return baseDtoFromJson(e.response?.data as String? ?? '');
//     }
//   }
// }
