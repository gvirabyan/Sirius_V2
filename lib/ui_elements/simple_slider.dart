import 'package:flutter/material.dart';

import '../screens/services_page.dart';

class CategoryItem {
  final String title;
  final String imagePath;

  CategoryItem({required this.title, required this.imagePath});
}

class SimpleSlider extends StatelessWidget {
  final List<CategoryItem> categories = [
    CategoryItem(title: 'Beauty & Spa', imagePath: 'assets/categories/beauty.png'),
    CategoryItem(title: 'Aesthetic Medicine', imagePath: 'assets/categories/aesthetic.png'),
    CategoryItem(title: 'Gym & Fitness', imagePath: 'assets/categories/gym.png'),
    CategoryItem(title: 'POOLS', imagePath: 'assets/categories/pools.png'),
    CategoryItem(title: 'Health & Medical', imagePath: 'assets/categories/health.png'),
    CategoryItem(title: 'Yoga & Wellness', imagePath: 'assets/categories/yoga.png'),
  ];

  void _onItemTapped(BuildContext context, int index) async {
    // Показываем лоадер
    showDialog(
      context: context,
      barrierDismissible: false, // запрещаем закрытие по тапу
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    // Ждём 2 секунды
    await Future.delayed(const Duration(seconds: 2));

    // Закрываем диалог
    Navigator.of(context, rootNavigator: true).pop();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServicesPage(category_index: index),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.5, // 50% высоты экрана
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // При нажатии вызываем метод для перехода и отображения лоадера
              _onItemTapped(context, index);
            },
            child: Container(
              width: screenWidth * 0.8, // 70% ширины экрана
              margin: EdgeInsets.only(
                right: index == categories.length - 1 ? 0 : 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(categories[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    color: Colors.white.withOpacity(0.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            categories[index].title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
