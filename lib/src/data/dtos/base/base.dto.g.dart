// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDto _$BaseDtoFromJson(Map<String, dynamic> json) => BaseDto(
      success: json['success'] as bool? ?? false,
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$BaseDtoToJson(BaseDto instance) => <String, dynamic>{
      'success': instance.success,
      'payload': instance.payload,
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
