import 'package:flutter/material.dart';
import '../screens/company_page.dart';
import 'companies_card_model.dart'; // Импорт модели

class CompaniesCardModel {
  final String title;
  final String subtitle;
  final String location;
  final double rating;
  final String imageUrl;
  final List<IconData> features;

  CompaniesCardModel({
    required this.title,
    required this.subtitle,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.features,
  });
}

class CompaniesCard extends StatelessWidget {
  final CompaniesCardModel company;

  const CompaniesCard({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  company.imageUrl,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.favorite_border),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5C5F82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CompanyPage()),
                    );
                  },
                  child: const Text(
                    'ՏԵՍՆԵԼ ԱՎԵԼԻՆ →',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company.subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        company.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          company.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  company.location,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: company.features
                      .map((icon) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(icon, size: 20),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
