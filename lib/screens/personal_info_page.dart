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
                '  Անձնական տվյալներ',
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
                        'Անուն ազգանուն *',
                        style: AppStyles.inputHint,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextField(
                      decoration: AppStyles.inputDecorationStyle.copyWith(
                        hintText: 'Մարիամ Ասատրյան'
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Text(
                        'Հասցե *',
                        style: AppStyles.inputHint,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextField(
                      decoration: AppStyles.inputDecorationStyle.copyWith(
                          hintText: 'Ք․Իջևան,Անկախության 3/1'
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Text(
                        'Էլ․հասցե *',
                        style: AppStyles.inputHint,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextField(
                      decoration: AppStyles.inputDecorationStyle.copyWith(
                          hintText: 'mar.asatryan@gmail.com'
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Text(
                        'Հեռ․համար *',
                        style: AppStyles.inputHint,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextField(
                      decoration: AppStyles.inputDecorationStyle.copyWith(
                          hintText: '+374 77 07 17'
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Align(
                        alignment: Alignment.centerLeft,
                        // Align text to the left
                        child: OutlinedButton(
                          onPressed: () {      PasswordChangePage().showPasswordChangeDialog(context);},
                          style: AppStyles.outlinedButton,
                          child: const Text('Փոխել գաղտնաբառը'),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Align(
                        alignment: Alignment.centerRight,
                        // Align text to the left
                        child: OutlinedButton(
                          onPressed: () {

                          },
                          style: AppStyles.filledButtonPurple,

                          child: const Text('Պահպանել',style: TextStyle(color: Colors.white)),
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
      ), index: 5,
    );
  }
}
