// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRepo _$UserRepoFromJson(Map<String, dynamic> json) => UserRepo(
      id: json['id'] as String?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      country: json['country'] as String?,
      fullName: json['full_name'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      phoneCountry: json['phone_country'] as String?,
    );

Map<String, dynamic> _$UserRepoToJson(UserRepo instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'country': instance.country,
      'email': instance.email,
      'username': instance.username,
      'id': instance.id,
      'phone_country': instance.phoneCountry,
      'phone': instance.phone,
      'full_name': instance.fullName,
    };
