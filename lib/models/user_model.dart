class UserModel {
  final String name;
  final String surname;
  final String phoneNumber;
  final String email;
  final String password;
  final String confirmPassword;


  UserModel({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.confirmPassword
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "phone_number": phoneNumber,
      "email": email,
      "password": password,
      "confirm_password":password
    };
  }
}
