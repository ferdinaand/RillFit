import 'dart:convert';

class RegisterDto {
  RegisterDto({
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.password,
  });

  RegisterDto.empty({
    this.email = '',
    this.fullName = '',
    this.password = '',
    this.phoneNumber = '',
  });

  String email;
  String phoneNumber;
  String fullName;
  String password;

  @override
  String toString() {
    final registrationData = {
      'email': email,
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'password': password,
    };
    return jsonEncode(registrationData);
  }
}
