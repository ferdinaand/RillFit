// ignore_for_file: file_names
class usersDetails {
  factory usersDetails.fromJson(dynamic jsonData) => usersDetails(
        fullName: jsonData['fullName'] as String?,
        phoneNumber: jsonData['phone'] as String?,
        userName: jsonData['username'] as String?,
        userId: jsonData['_id'] as String?,
        // profileImage: jsonData['fullName'] as String?,
        userType: jsonData['type'] as String?,
        gymId: jsonData['gyms'] as List<dynamic>,
      );
  usersDetails({
    this.fullName,
    this.phoneNumber,
    this.profileImage,
    this.userName,
    this.userId,
    this.gymId,
    this.userType,
  });
  List<dynamic>? gymId;
  String? fullName;
  String? phoneNumber;
  String? profileImage;
  String? userName;
  String? userId;
  String? userType;
}
