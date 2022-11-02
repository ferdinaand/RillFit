// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.entity.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  createToJson: true,
)
@HiveType(typeId: 0)
class UserRepo extends HiveObject {
  @HiveField(0)
  final String? avatar;
  @HiveField(1)
  final String? country;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? username;
  @HiveField(4)
  final String? id;
  @HiveField(5)
  final String? phoneCountry;
  @HiveField(6)
  final String? phone;
  @HiveField(7)
  final String? fullName;

  UserRepo({
    this.id,
    this.avatar,
    this.email,
    this.country,
    this.fullName,
    this.username,
    this.phone,
    this.phoneCountry,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar': avatar,
      'country': country,
      'email': email,
      'username': username,
      'id': id,
      'phoneCountry': phoneCountry,
      'phone': phone,
      'fullName': fullName,
    };
  }

  factory UserRepo.fromMap(Map<String, dynamic> map) {
    return UserRepo(
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      phoneCountry:
          map['phoneCountry'] != null ? map['phoneCountry'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRepo.fromJson(String source) =>
      UserRepo.fromMap(json.decode(source) as Map<String, dynamic>);
}
