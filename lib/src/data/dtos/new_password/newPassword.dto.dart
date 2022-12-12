import 'package:json_annotation/json_annotation.dart';
part 'newPassword.dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
)
class NewPasswordDto {
  NewPasswordDto({
    required this.newPassword,
    required this.otp,
    required this.email,
  });

  NewPasswordDto.empty({
    this.newPassword = '',
    this.otp = '',
    this.email = '',
  });

  final String newPassword;
  final String otp;
  final String email;
  factory NewPasswordDto.fromJson(Map<String, dynamic> json)=> 
  _$NewPasswordDtoFromJson(json);
  Map<String, dynamic> toJson()=> _$NewPasswordDtoToJson(this);
  
}