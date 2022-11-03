// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRepoAdapter extends TypeAdapter<UserRepo> {
  @override
  final int typeId = 0;

  @override
  UserRepo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRepo(
      id: fields[4] as String?,
      avatar: fields[0] as String?,
      email: fields[2] as String?,
      country: fields[1] as String?,
      fullName: fields[7] as String?,
      username: fields[3] as String?,
      phone: fields[6] as String?,
      phoneCountry: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserRepo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.avatar)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.phoneCountry)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
