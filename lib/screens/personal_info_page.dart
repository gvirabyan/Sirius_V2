import 'package:flutter/material.dart';
import 'package:untitled9/screens/password_change_page.dart';
import 'package:untitled9/ui_elements/sirius_info_widgets.dart';

import '../styles.dart';
import '../ui_elements/sirius_scaffold.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiriusScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                '  PERSONAL INFORMATION',
                style: AppStyles.myStyle.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.04),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Text(
                        'Full Name *',
                        style: AppStyles.inputHint,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextField(
                      decoration: AppStyles.inputDecorationStyle,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Text(
                        'Address *',
                        style: AppStyles.inputHint,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextField(
                      decoration: AppStyles.inputDecorationStyle,
                    ),
                    Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Text(
                        'E-mail *',
                        style: AppStyles.inputHint,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextField(
                      decoration: AppStyles.inputDecorationStyle,
                    ),
                    Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Text(
                        'Phone Number *',
                        style: AppStyles.inputHint,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextField(
                      decoration: AppStyles.inputDecorationStyle,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Align(
                        alignment: Alignment.centerLeft,
                        // Align text to the left
                        child: OutlinedButton(
                          onPressed: () {      PasswordChangePage().showPasswordChangeDialog(context);},
                          style: AppStyles.outlinedButton,
                          child: const Text('Change Password'),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Align(
                        alignment: Alignment.centerRight,
                        // Align text to the left
                        child: OutlinedButton(
                          onPressed: () {},
                          style: AppStyles.filledButtonPurple,

                          child: const Text('Save'),
                        ))
                    ,

                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              SiriusInfoWidgets()
            ],
          ),
        ),
      ),
    );
  }
}
