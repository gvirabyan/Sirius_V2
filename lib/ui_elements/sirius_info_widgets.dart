import 'package:flutter/material.dart';
import 'package:untitled9/styles.dart';

class SiriusInfoWidgets extends StatelessWidget {
  const SiriusInfoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('assets/icons/sirius_icon2.png'),
      SizedBox(height: MediaQuery
          .of(context)
          .size
          .height * 0.05),

      /*@override
    Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    color: Colors.white,*/
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Первая секция
          const Text(
            'Ընկերության մասին',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sirius-ի մասին',
            style: TextStyle(color: Colors.grey),
          ),
          const Text(
            'Բլոգ',
            style: TextStyle(color: Colors.grey),
          ),
          const Text(
            'Թողարկված առաջխաղացումներ',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),

          // Вторая секция
          const Text(
            'Աջակցություն',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Հաճախակի տրվող հարցեր',
            style: TextStyle(color: Colors.grey),
          ),
          const Text(
            'Սպասարկման կենտրոն',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),

          // Контакты
          const Text(
            'Կապ մեզ հետ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'support@sirius.am',
            style: TextStyle(color: Colors.grey),
          ),
          const Text(
            '+374 (XX) XXX-XXX',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),


          const SizedBox(height: 32),

          // Социальные сети
          const Text(
            'Հետեւեք մեզ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.account_circle_outlined
                ), onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                    Icons.account_circle_outlined
                ), onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                    Icons.account_circle_outlined
                ), onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                    Icons.account_circle_outlined
                ), onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Подвал
          const Text(
            '© 2025 SIRIUS. ԲՈԼՈՐ ԻՐԱՎՈՒՆՔՆԵՐԸ ՊԱՀՊԱՆՎԱԾ ԵՆ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Գաղտնիության քաղաքականություն\nՊայմաններ եւ դրույթներ',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ]);
  }
}
