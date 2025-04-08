import 'package:flutter/material.dart';
import 'package:untitled9/screens/user_home_page.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? fullNameError;
  String? phoneError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  final AuthService _authService = AuthService();

  Future<void> signUp(BuildContext context) async {
    fullNameError = null;
    phoneError = null;
    emailError = null;
    passwordError = null;
    confirmPasswordError = null;

    String fullName = fullNameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (fullName.isEmpty) fullNameError = "Full name is required";
    if (phone.isEmpty) phoneError = "Phone number is required";
    if (email.isEmpty) emailError = "Email is required";
    if (password.isEmpty) passwordError = "Password is required";
    if (confirmPassword.isEmpty) confirmPasswordError = "Confirm your password";
    if (password != confirmPassword) confirmPasswordError = "Passwords do not match";

    notifyListeners();

    if (fullNameError != null || phoneError != null || emailError != null || passwordError != null || confirmPasswordError != null) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    UserModel newUser = UserModel(
      fullName: fullName,
      phoneNumber: phone,
      email: email,
      password: password,
      confirmPassword: confirmPassword
    );

    int success = await _authService.register(newUser);

    _isLoading = false;
    notifyListeners();

    if (success==200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserHomePage()),
      );}
      else if(success==422){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Validation Error")),
      );
    }
     else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration failed")),
      );
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
