class RegisterDto {
  RegisterDto({
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.password,
  });

  String email;
  String phoneNumber;
  String fullName;
  String password;
}
