import 'package:json_annotation/json_annotation.dart';
part 'enter_reset_otp.dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
)
class EnterResetOtpDto {
  EnterResetOtpDto({
    required this.otp,
  });

  EnterResetOtpDto.empty({
    this.otp = '',
  });

  final String otp;
  factory EnterResetOtpDto.fromJson(Map<String, dynamic> json)=> 
  _$EnterResetOtpDtoFromJson(json);
  Map<String, dynamic> toJson()=> _$EnterResetOtpDtoToJson(this);
  
}