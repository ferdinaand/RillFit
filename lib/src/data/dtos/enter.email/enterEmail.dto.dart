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

  factory EnterEmailDto.fromJson(Map<String, dynamic> json) =>
      _$EnterEmailDtoFromJson(json);

  EnterEmailDto.empty({
    this.email = '',
  });

  final String email;
  Map<String, dynamic> toJson() => _$EnterEmailDtoToJson(this);
}
