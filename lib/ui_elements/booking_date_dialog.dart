import 'package:flutter/material.dart';

import '../screens/payment_page.dart';
import '../screens/payment_page1.dart';

class BookingDateDialog extends StatefulWidget {
  const BookingDateDialog({Key? key}) : super(key: key);

  @override
  _BookingDateDialogState createState() => _BookingDateDialogState();
}

class _BookingDateDialogState extends State<BookingDateDialog> {
  String selectedTime = '10:00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      appBar: AppBar(
        title: const Text('Ամրագրում'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeaderLinks(),
            const SizedBox(height: 16),
            _buildTimeSelectionCard(),
            const SizedBox(height: 16),
            _buildPriceSummaryCard(),
            const SizedBox(height: 16),
            _buildNoteText(),
            const SizedBox(height: 20),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Մուտքագրեք անունը', style: TextStyle(color: Colors.blueGrey)),
        SizedBox(height: 4),
        Text('Մուտքագրեք հեռախոսահամարը', style: TextStyle(color: Colors.blueGrey)),
      ],
    );
  }

  Widget _buildTimeSelectionCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ժամը և ամսաթիվը', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildButton('03/05/2025', Icons.calendar_today)),
                const SizedBox(width: 12),
                Expanded(child: _buildTimeDropdown()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, IconData icon) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: Colors.deepPurple),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildTimeDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedTime,
          icon: const Icon(Icons.arrow_drop_down),
          items: ['09:45', '10:00', '10:25', '11:00', '11:30']
              .map((time) => DropdownMenuItem(value: time, child: Text(time)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedTime = value;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildPriceSummaryCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            _PriceRow(label: 'Ընդհանուր', value: '10,000֏'),
            _PriceRow(label: 'Զեղչ', value: '-1,000֏'),
            Divider(),
            _PriceRow(label: 'Ընդամենը', value: '9,000֏', isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteText() {
    return const Text(
      'Ամրագրելով այս ծառայությունը՝ դուք ընդունում եք մեր պայմաններն ու դրույթները։ '
          'Ամրագրումը կարող է փոփոխվել կամ չեղարկվել մինչև այցի ժամից 48 ժամ առաջ։ '
          'Այլապես կանխավճարը վերադարձի ենթակա չէ։',
      style: TextStyle(color: Colors.black87, fontSize: 13),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () { Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage1()),
      );},
      child: const Text('ԱՎԱՐՏԵԼ ԱՄՐԱԳՐՈՒՄԸ'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _PriceRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}
