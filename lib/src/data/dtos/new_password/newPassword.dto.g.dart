// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newPassword.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPasswordDto _$NewPasswordDtoFromJson(Map<String, dynamic> json) =>
    NewPasswordDto(
      newPassword: json['newPassword'] as String,
      otp: json['otp'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$NewPasswordDtoToJson(NewPasswordDto instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'otp': instance.otp,
      'email': instance.email,
    };
