import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riilfit/src/presentation/resources/strings.res.dart';

part 'base.dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
)
class BaseDto {
  BaseDto({
    this.success = false, //false by default
    this.payload = const <String, dynamic>{},
    this.message,
    this.statusCode,
  });

  factory BaseDto.fromJson(Map<String, dynamic> json) =>
      _$BaseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDtoToJson(this);

  bool success;
  Map<String, dynamic> payload;
  String? message;
  int? statusCode;
}

Future<BaseDto> baseDtoFromJson(String str) async {
  //if the string is long, use compute for the parsing
  if (str.length > maxJsonStringLength) {
    return compute(parseBigJson, str);
  }

  final jsonData = json.decode(str) as Map<String, dynamic>;
  return BaseDto.fromJson(jsonData);
}

String baseDtoDataToString(dynamic data) => json.encode(data);
dynamic baseDtoDataToJson(String data) => json.decode(data);

BaseDto parseBigJson(String jsonStr) {
  final jsonData = json.decode(jsonStr) as Map<String, dynamic>;
  return BaseDto.fromJson(jsonData);
}
