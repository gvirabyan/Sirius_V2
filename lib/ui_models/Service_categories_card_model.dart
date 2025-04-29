import 'package:flutter/material.dart';
import 'package:untitled9/screens/services_page.dart';

class ServicesCategoriesCardModel extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int index;

  const ServicesCategoriesCardModel({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // Background image
          SizedBox(
            width: 300,
            height: 400,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),

          // Gradient overlay
          Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // Title & Description at the top
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'YourCustomFont', // optional
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          // Button at the bottom
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ServicesPage(category_index: index)),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Flexible(
                      child: Text(
                        "ԲՈԼՈՐ ԾԱՌԱՅՈՒԹՅՈՒՆՆԵՐԸ",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, size: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
