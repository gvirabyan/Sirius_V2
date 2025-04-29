import 'package:flutter/material.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';

class BookingBagPage extends StatefulWidget {
  const BookingBagPage({Key? key}) : super(key: key);

  @override
  State<BookingBagPage> createState() => _BookingBagPageState();
}

class _BookingBagPageState extends State<BookingBagPage> {
  String serviceFor = 'Order for someone else';
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final timeOptions = ['09:45', '10:00', '10:25', '11:00', '11:30'];
  String selectedTime = '10:00';

  @override
  Widget build(BuildContext context) {
    return SiriusScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/background.jpg',
                            // замените на своё изображение
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('NAILS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 4),
                            Text('60 minutes',
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 4),
                            Text('8,000 AMD', style: TextStyle(fontSize: 16)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Service for
                const Text('Who is this service for?',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: serviceFor,
                  items: [
                    DropdownMenuItem(
                        value: 'Order for someone else',
                        child: Text('Order for someone else')),
                    DropdownMenuItem(value: 'For me', child: Text('For me')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      serviceFor = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter name',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                  ),
                ),
                const SizedBox(height: 20),

                // Date & Time
                const Text('Time & Date',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Today'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Tomorrow'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Choose available day'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedTime,
                        items: timeOptions
                            .map((time) => DropdownMenuItem(
                                value: time, child: Text(time)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedTime = value!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Summary
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        SummaryRow(label: 'Subtotal', amount: '38,000 AMD'),
                        SummaryRow(label: 'Discount', amount: '-5,000 AMD'),
                        Divider(),
                        SummaryRow(
                            label: 'Total', amount: '33,000 AMD', bold: true),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Terms
                const Text(
                  'By booking this service, you agree to our terms and conditions. You can cancel or reschedule your appointment up to 48 hours in advance for a full refund of the deposit. Cancellations made less than 48 hours before the appointment are non-refundable.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('COMPLETE YOUR BOOKING'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      index: 9,
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool bold;

  const SummaryRow({
    Key? key,
    required this.label,
    required this.amount,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = bold
        ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
        : const TextStyle(fontSize: 14);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(amount, style: style),
        ],
      ),
    );
  }
}
