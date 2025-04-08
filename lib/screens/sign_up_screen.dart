import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/sign_up_controller.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpController(),
      child: Consumer<SignUpController>(
        builder: (context, controller, child) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: Colors.black.withOpacity(0.2)),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Sign Up", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                _buildTextField(controller.fullNameController, "Fullname", controller.fullNameError),
                                _buildTextField(controller.phoneController, "Phone Number", controller.phoneError),
                                _buildTextField(controller.emailController, "Email", controller.emailError),
                                _buildTextField(controller.passwordController, "Password", controller.passwordError, obscureText: true),
                                _buildTextField(controller.confirmPasswordController, "Confirm Password", controller.confirmPasswordError, obscureText: true),
                                const SizedBox(height: 20),
                                controller.isLoading
                                    ? const CircularProgressIndicator()
                                    : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  onPressed: () => controller.signUp(context),
                                  child: const Text("SIGN UP", style: TextStyle(color: Colors.white)),
                                ),
                                const SizedBox(height: 20),
                                const Text("Or sign in with"),
                                const SizedBox(height: 10),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset('assets/icons/google.svg', width: 48, height: 48),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset('assets/icons/facebook.svg', width: 48, height: 48),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset('assets/icons/apple.svg', width: 48, height: 48),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, String? errorText, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: errorText != null ? Colors.red : Colors.grey),
          ),
          hintText: hintText,
          errorText: errorText,
        ),
      ),
    );
  }
}
