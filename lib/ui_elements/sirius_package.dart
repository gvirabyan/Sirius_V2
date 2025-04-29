import 'package:flutter/material.dart';
import 'package:untitled9/screens/payment_page.dart';

class SiriusPackage extends StatefulWidget {
  @override
  _SiriusPackageState createState() => _SiriusPackageState();
}

class _SiriusPackageState extends State<SiriusPackage> {
  bool _isLoading = false; // Состояние для отслеживания загрузки

  // Функция, которая будет вызываться при нажатии на кнопку
  void _onSubscribe() {
    setState(() {
      _isLoading = true;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage()),
      );
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Выключаем индикатор загрузки
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF1F3FF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.check_circle_rounded,
                    size: 24, color: Colors.grey.shade600),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A4D6A),
                    foregroundColor: const Color(0xFFFFFFFF),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () {},
                  child: const Text('Լավագույն արժեք'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'ՊՐԵՄԻՈՒՄ ՓԱԹԵԹ',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Անսահմանափակ մուտք մարզասրահի ամբողջ սարքավորումների և մարզվելու գոտիների համար',
              style: TextStyle(color: Color(0xFF000000), fontSize: 14),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  '20,000դր ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text('ամսական')
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _onSubscribe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ).copyWith(
                  backgroundColor:
                      WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.white;
                    }
                    return Colors.black;
                  }),
                  foregroundColor:
                      WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.black;
                    }
                    return Colors.white;
                  }),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                    : const Text(
                        'Բաժանորդագրվել հիմա',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
            const SizedBox(height: 24),
            // Features
            FeatureItem(text: 'Անսահմանափակ մուտք մարզումների գոտիները'),
            FeatureItem(
                text:
                    'Անվճար խմբային ֆիթնես դասեր (Յոգա, HIIT, Զումբա և այլնի)'),
            FeatureItem(text: '5 անվճար անհատական մարզում'),
            FeatureItem(text: 'Մուտք սաունա և վերականգնման գոտի'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Վավերականություն: 1 ամիս շարունակվող բաժանորդագրություն',
                    style: TextStyle(fontSize: 12, color: Color(0xFF7A7D9C)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Պայմաններ: դադարեցնել ցանկացած պահի | Ավտոմատ երկարաձգում ակտիվ է',
                    style: TextStyle(fontSize: 12, color: Color(0xFF7A7D9C)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFFB4B8D9), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Color(0xFF3F4255)),
            ),
          ),
        ],
      ),
    );
  }
}
