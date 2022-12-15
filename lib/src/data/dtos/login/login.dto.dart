import 'dart:convert';

class LoginDto {
  LoginDto({
    required this.emailPhone,
    required this.password,
  });

  LoginDto.empty({
    this.emailPhone = '',
    this.password = '',
  });

  String emailPhone;
  String password;

  @override
  String toString() {
    final registrationData = {
      'emailPhone': emailPhone,
      'password': password,
    };
    return jsonEncode(registrationData);
  }
}
