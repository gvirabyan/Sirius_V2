import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSignInSelected = true;

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
                  child: Container(color: Colors.black.withOpacity(0.1)),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildToggleButton(
                                        "ՄՈՒՏՔ", isSignInSelected, () {
                                      setState(() {
                                        isSignInSelected = true;
                                      });
                                    }),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2),
                                    _buildToggleButton(
                                        "ԳՐԱՆՑՈՒՄ", !isSignInSelected, () {
                                      setState(() {
                                        isSignInSelected = false;
                                      });
                                    }),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                const SizedBox(height: 10),
                                ...(!isSignInSelected
                                    ? [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Անուն *",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        _buildTextField(
                                          controller.nameController,
                                          "Մարիամ",
                                          controller.nameError,
                                        ),
                                      ]
                                    : []),
                                ...(!isSignInSelected)
                                    ? [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Ազգանուն *",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        _buildTextField(
                                          controller.surnameController,
                                          "Ավանեսյան",
                                          controller.surnameError,
                                        ),
                                      ]
                                    : [],
                                ...(!isSignInSelected)
                                    ? [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Հեռ․համար *",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        _buildTextField(
                                          controller.phoneController,
                                          "37494182880",
                                          controller.phoneError,
                                        )
                                      ]
                                    : [],
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Էլ․հասցե *",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 5),
                                _buildTextField(
                                  controller.emailController,
                                  "namesurname@gmail.com",
                                  controller.emailError,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Գաղտնաբառ *",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 5),
                                _buildTextField(
                                  controller.passwordController,
                                  "********",
                                  controller.passwordError,
                                  obscureText: true,
                                ),
                                ... (!isSignInSelected)?[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Կրկնել գաղտնաբառ *",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                SizedBox(height: 5),
                                _buildTextField(
                                  controller.confirmPasswordController,
                                  "********",
                                  controller.confirmPasswordError,
                                  obscureText: true,
                                )]:[],
                                const SizedBox(height: 20),
                                controller.isLoading
                                    ? const CircularProgressIndicator()
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.purple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (isSignInSelected) {
                                            controller.signIn(context);
                                          } else {
                                            controller.signUp(context);
                                          }
                                        },
                                        child: Text(
                                          isSignInSelected
                                              ? "ՄՈՒՏՔ ԳՈՐԾԵԼ"
                                              : "ԳՐԱՆՑՎԵԼ",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
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
                                      icon: SvgPicture.asset(
                                        'assets/icons/google.svg',
                                        width: 48,
                                        height: 48,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/facebook.svg',
                                        width: 48,
                                        height: 48,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/apple.svg',
                                        width: 48,
                                        height: 48,
                                      ),
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

  Widget _buildTextField(
      TextEditingController controller, String hintText, String? errorText,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide:
                BorderSide(color: errorText != null ? Colors.red : Colors.grey),
          ),
          hintText: hintText,
          errorText: errorText,
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 60,
            color: isSelected ? Colors.white : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
