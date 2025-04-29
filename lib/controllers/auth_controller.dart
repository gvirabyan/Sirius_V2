import 'package:flutter/material.dart';
import 'package:untitled9/screens/user_home_page.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? nameError;
  String? surnameError;
  String? phoneError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  final AuthService _authService = AuthService();

  Future<void> signUp(BuildContext context) async {
    nameError = null;
    surnameError = null;
    phoneError = null;
    emailError = null;
    passwordError = null;
    confirmPasswordError = null;

    String name = nameController.text.trim();
    String surname = surnameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty) nameError = "Name is required";
    if (surname.isEmpty) surnameError = "Surname is required";
    if (phone.isEmpty) phoneError = "Phone number is required";
    if (email.isEmpty) emailError = "Email is required";
    if (password.isEmpty) passwordError = "Password is required";
    if (confirmPassword.isEmpty) confirmPasswordError = "Confirm your password";
    if (password != confirmPassword) confirmPasswordError = "Passwords do not match";

    notifyListeners();

    if (nameError != null || surnameError != null || phoneError != null || emailError != null || passwordError != null || confirmPasswordError != null) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    UserModel newUser = UserModel(
        name: name,
        surname: surname,
        phoneNumber: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword
    );

    int success = await _authService.register(newUser);

    _isLoading = false;
    notifyListeners();

    if (success == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserHomePage()),
      );
    } else if (success == 422) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Validation Error")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration failed")),
      );
    }
  }

  Future<void> signIn(BuildContext context) async {
    emailError = null;
    passwordError = null;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Простая валидация
    if (email.isEmpty) emailError = "Email is required";
    if (password.isEmpty) passwordError = "Password is required";

    notifyListeners();

    if (emailError != null || passwordError != null) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    int success = await _authService.login(email, password);

    _isLoading = false;
    notifyListeners();

    if (success == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserHomePage()),
      );

    } else if (success == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login failed")),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
