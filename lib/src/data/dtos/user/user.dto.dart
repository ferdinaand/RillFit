// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  createToJson: true,
)
@HiveType(typeId: 0)
class UserDto extends HiveObject {
  @HiveField(0)
  String? fullName;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? phoneNumber;
  @HiveField(3)
  String? role;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;
  @HiveField(6)
  bool? isPhoneNumberVerified;

  UserDto({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.role,
    this.isPhoneNumberVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
