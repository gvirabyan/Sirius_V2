import 'package:flutter/material.dart';

import '../screens/user_home_page.dart';
import '../ui_elements/booking_date_dialog.dart';

class ServiceCardModel extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String location;
  final double rating;
  final String imageUrl;
  final bool isLimited;

  const ServiceCardModel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.isLimited,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (isLimited)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Կարճաժամկետ առաջարկ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating row
                Row(
                  children: [
                     Text(title.toString()),
                    const SizedBox(width: 6),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                // Title
                Text(
                  subtitle,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                // Price
                Text(
                  '$price ֏',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    icon: const Icon(Icons.calendar_today, size: 16),
                    label: const Text('Ամրագրել հիմա'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          insetPadding: const EdgeInsets.all(16), // Чтобы он не занимал весь экран
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.85, // Почти весь экран
                            width: double.infinity,
                            child:  BookingDateDialog(), // Вставляем сам BookingPage
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 6),
                // Location
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
