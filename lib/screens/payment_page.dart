import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled9/screens/payment_success_page.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedCard = 'visa';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SiriusScaffold(
      index: 2,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[
          const SizedBox(height: 50),

          Text('Ընտրեք վճարման եղանակը'),
          const SizedBox(height: 20),

          _buildCardOption(
              cardType: 'visa',
              iconPath: 'assets/icons/visa.svg',
              cardNumber: '•••• •••• •••• 4806',
            ),
            const SizedBox(height: 20),
            _buildCardOption(
              cardType: 'mastercard',
              iconPath: 'assets/icons/mastercard.svg',
              cardNumber: '•••• •••• •••• 4309',
            ),
            const Spacer(),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _selectedCard != null ? _onConfirmPressed : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Հաստատել վճարումը'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onConfirmPressed() async {
    setState(() {
      _isLoading = true;
    });

    // имитация загрузки (например, запрос к серверу)
    await Future.delayed(const Duration(seconds: 2));

    // Переход на новую страницу (например, экран успеха)
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const PaymentSuccessPage()),
    );
  }

  Widget _buildCardOption({
    required String cardType,
    required String iconPath,
    required String cardNumber,
  }) {
    final isSelected = _selectedCard == cardType;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCard = cardType;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 40,
              height: 40,
              placeholderBuilder: (context) =>
              const CircularProgressIndicator(),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                cardNumber,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Radio<String>(
              value: cardType,
              groupValue: _selectedCard,
              onChanged: (value) {
                setState(() {
                  _selectedCard = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
