import 'package:flutter/material.dart';
import 'package:untitled9/styles.dart';

class PasswordChangePage extends StatelessWidget {
  const PasswordChangePage({super.key});

  // Делаем метод публичным, чтобы его можно было вызвать из других классов
  void showPasswordChangeDialog(BuildContext context) {
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text('Change Password',textAlign: TextAlign.center,style: AppStyles.myStyle,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Old Password *',
                  style: AppStyles.inputHint,
                ),
              ),
              TextField(
                controller: oldPasswordController,
                decoration: AppStyles.inputDecorationStyle,

                obscureText: true,
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'New Password *',
                  style: AppStyles.inputHint,
                ),
              ),
              TextField(
                controller: newPasswordController,
                decoration: AppStyles.inputDecorationStyle,

                obscureText: true,
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Confirm New Password *',
                  style: AppStyles.inputHint,
                ),
              ),
              TextField(
                controller: confirmPasswordController,
                decoration: AppStyles.inputDecorationStyle,

                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            Align(
                child: TextButton(
                  onPressed: () {
                    String oldPassword = oldPasswordController.text;
                    String newPassword = newPasswordController.text;
                    String confirmPassword = confirmPasswordController.text;

                    if (newPassword == confirmPassword) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Password changed successfully!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Passwords do not match!')),
                      );
                    }
                  },
                  style: AppStyles.filledButtonPurple,
                  child: const Text('CONFIRM'),
                ),),



          ],
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
