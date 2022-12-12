import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/route_manager.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/presentation/resources/strings.res.dart';

class AuthRepositories {
     static const storage = FlutterSecureStorage();
 final String baseURL = BASE_API_URL;
  Dio dio = Dio();

  Future authPost (dynamic dto,String endPoint)async {
        // initalizedEndPoint = /user/initResetPassword
        // finishedEndPoint = /user/finishResetPassword
        try{
           // ignore: omit_local_variable_types, strict_raw_type
           final Response response = await dio.post(
            baseURL+endPoint,
            data: dto,);
            if (kDebugMode) {
                print(response.statusCode);
              }
               return response.data;
        }on DioError catch (dioError){
          return dioError.error.toString();
        }
  }
  Future getAuth(String endPoint)async{
     try {
       final response = await dio.get(
        baseURL+endPoint,
       );
       if (response.statusCode == 200){
        GetSnackBar(
          message: response.data.toString(),
          backgroundColor: primary,
          );
       }else{
        GetSnackBar(
          message:response.statusMessage
        );
       }
       if (kDebugMode) {
         print(response.data.toString());
         return response.data;
       }
     }on DioError catch (dioError){
      return dioError.error.toString();
     }
  }
  //secure Storage package used to temporarily store  data
  // use to store Otp, email,newPassword to be  passed to the finish_reset_endPoint
    static  Future <void> storeEmail(String email)async{
    await storage.write(key: 'email', value: email);
  }
    static Future<String?> getEmail() async {
     return await storage.read(key: 'email');
  }
    static  Future <void> storeOtp(String otp)async{
    return await storage.write(key: 'otp', value: otp);
  }
    static Future<String?> getOTP() async {
    return await storage.read(key: 'otp');
  }
    static  Future <void> storeNewPassword(String newPassword)async{
    return await storage.write(key: 'newPassword', value: newPassword);
  }
    static Future<String?> getNewPassword() async {
    return await storage.read(key: 'newPassword');
  }
}
