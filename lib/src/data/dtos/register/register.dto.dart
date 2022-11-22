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
}
