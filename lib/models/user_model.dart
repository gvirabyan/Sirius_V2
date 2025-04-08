class UserModel {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String password;
  final String confirmPassword;


  UserModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.confirmPassword
  });

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "phone_number": phoneNumber,
      "email": email,
      "password": password,
      "confirm_password":password
    };
  }
}
