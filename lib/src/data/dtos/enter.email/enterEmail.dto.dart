import 'package:json_annotation/json_annotation.dart';
part 'enterEmail.dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
)
class EnterEmailDto {
  EnterEmailDto({
    required this.email,
  });

  EnterEmailDto.empty({
    this.email = '',
  });

  final String email;
  factory EnterEmailDto.fromJson(Map<String, dynamic> json)=> 
  _$EnterEmailDtoFromJson(json);
  Map<String, dynamic> toJson()=> _$EnterEmailDtoToJson(this);
  
}