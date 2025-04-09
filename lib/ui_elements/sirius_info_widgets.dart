import 'package:flutter/material.dart';
import 'package:untitled9/styles.dart'; // Подключаем стили, если нужно

class SiriusInfoWidgets extends StatelessWidget {
  const SiriusInfoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/icons/sirius_icon2.png'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Column(
          children: [
            Text(
              'BECOME A PARTNER',
              style: AppStyles.headline,
            ),
            Divider(
              color: Color(0xFF252591),
              thickness: 2,
              indent: 45,
              endIndent: 45,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              const Text('HOME'),
              const Text('COMPANIES'),
              const Text('CONTACT US'),
              const Text('CONTACT US'),
              const Text('FACEBOOK'),
              const Text('INSTAGRAM'),
              const Text('LINKEDIN'),
              const Text('YOUTUBE'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Sirius@gmail.com',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  '+374 990087',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('EN', style: AppStyles.myStyle2),
                    SizedBox(width: 16),
                    Text('RU', style: AppStyles.myStyle2),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text('PRIVACY POLICY', style: AppStyles.myStyle2),
            ],
          ),
        ),
      ],
    );
  }
}
