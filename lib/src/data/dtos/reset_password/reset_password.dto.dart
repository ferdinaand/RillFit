import 'dart:convert';

class ResetPasswordDto {
  ResetPasswordDto({
    required this.otp,
    required this.email,
  });

  ResetPasswordDto.empty({
    this.otp = '',
    this.email = '',
  });

  final String otp;
  final String email;

  @override
  String toString() {
    final resetPasswordData = {
      'otp': otp,
      'email': email,
    };
    return jsonEncode(resetPasswordData);
  }
}
