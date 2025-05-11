import 'package:flutter/material.dart';
import 'package:untitled9/styles.dart';

import '../services/auth_service.dart';

class PasswordChangePage extends StatelessWidget {
  const PasswordChangePage({super.key});

  void showPasswordChangeDialog(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    bool obscureNewPassword = true;
    bool obscureConfirmPassword = true;
    bool isLoading = false; // Для отслеживания состояния загрузки

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                'Փոխել գաղտնաբառը',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Էլ․հասցե *'),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Նոր գաղտնաբառ*'),
                    ),
                    TextField(
                      controller: newPasswordController,
                      obscureText: obscureNewPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(obscureNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obscureNewPassword = !obscureNewPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Կրկնել գաղտնաբառը *'),
                    ),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: obscureConfirmPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (isLoading) // Показываем индикатор загрузки, если isLoading == true
                      const CircularProgressIndicator(),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    String email = emailController.text;
                    String newPassword = newPasswordController.text;
                    String confirmPassword = confirmPasswordController.text;

                    if (newPassword == confirmPassword) {
                      setState(() {
                        isLoading = true; // Начинаем загрузку
                      });

                      bool success = await AuthService().changePassword(
                        email: email,
                        newPassword: newPassword,
                        confirmPassword: confirmPassword,
                      );

                      setState(() {
                        isLoading = false; // Останавливаем загрузку
                      });

                      if (success) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Հաջողությամբ կատարվել է!'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Չի հաջողվել պահպանել'),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('գաղտնաբառերը տարբեր են!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Հաստատել'),
                ),
              ],
            );
          },
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
