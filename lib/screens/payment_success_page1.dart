import 'package:flutter/material.dart';

class PaymentSuccessPage1 extends StatelessWidget {
  const PaymentSuccessPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Container(
        color: Colors.white, // Устанавливаем белый фон
        child: Center(
        child: Column(

          children: [
        Padding(
        padding: EdgeInsets.only(top: 50),
           child:  Stack(
              alignment: Alignment.center,
              children: [

                Icon(
                  Icons.circle,
                  size: 80,
                  color: Color(0xFF9846BB),
                ),
                Icon(
                  Icons.check,
                  size: 40, // меньше галочка
                  color: Colors.white,
                ),
              ],
            ),),
            const Text(
              'Շնորհակալություն',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              'Ձեր ամրագրումը հաջողությամբ կատարվել է։',
              style: TextStyle(fontSize: 20, color: Color(0xFF707396)),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all( 30),
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SIRIUS\n'
                        'Դիմահարդարում',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _InfoRow(
                    icon: Icons.calendar_today,
                    label: 'Օր:',
                    value: '17 մայիսի, 2025թ․\n 11:00',
                  ),
                  const SizedBox(height: 12),

                  const SizedBox(height: 12),
                  _InfoRow(
                    icon: Icons.account_balance_wallet,
                    label: 'Վճարվել է:',
                    value: '9,000 դրամ',
                  ),
                  const SizedBox(height: 12),
                  _InfoRow(
                    icon: Icons.tv,
                    label: 'Վճարման եղանակ',
                    value: 'Վճարային քարտ',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // или перейти в главное меню
              },
              child: const Text('Վերադառնալ'),
            ),
          ],
        ),
      ),
    )));
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Color(0xFFB297F9)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
