import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled9/services/auth_service.dart';
import 'package:untitled9/styles.dart';
import 'package:untitled9/ui_elements/custom_card.dart';
import 'package:untitled9/ui_elements/simple_slider.dart';
import 'package:untitled9/ui_elements/sirius_app_bar.dart';
import 'package:untitled9/ui_elements/sirius_info_widgets.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    super.initState();
    _loadToken();
    print(AuthService.token);
    _startAutoSwitch();
  }


  /*final List<String> categories = [
    'BEAUTY & SPA',
    'GYM & FITNESS',
    'CLINICS',
    'TRAINERS',
    'TREATMENTS',
    'WELLNESS',
  ];*/

  final List<String> backgroundImages = [
    'assets/categories/aesthetic1.jpg',
    'assets/categories/beauty1.jpg',
    'assets/categories/gym1.png',
    'assets/categories/health1.jpg',
    'assets/categories/pools1.jpg',
  ];

  int _currentIndex = 0;
  late Timer _timer;

  void _startAutoSwitch() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 5;
      });
    });
  }

  void _onCategorySelected(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Restart the timer
    _timer.cancel();
    _startAutoSwitch();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    AuthService.token = prefs.getString('token')?? '';
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SiriusScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.9, // Примерно один экран
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image (НЕ скроллится)
                  // Фоновое изображение
                  Positioned.fill(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      child: SizedBox.expand( // <- ОБЯЗАТЕЛЬНО для полноэкранности
                        key: ValueKey<String>(backgroundImages[_currentIndex]),
                        child: Image.asset(
                          backgroundImages[_currentIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

// Полупрозрачная наложенная серая область
                  Container(
                    color: Colors.black.withOpacity(0.6), // Создаем наложение с полупрозрачным черным фоном
                  ),
// Основное содержимое страницы
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Поиск
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1), // Полупрозрачный фон
                            borderRadius: BorderRadius.circular(30), // Закругленные края
                            border: Border.all(color: Colors.white70), // Белая граница
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, color: Colors.white70), // Иконка поиска
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: Colors.white), // Цвет текста в поле
                                  decoration: InputDecoration(
                                    hintText: 'մարզասրահ կլինիկա․․․',
                                    hintStyle: TextStyle(color: Colors.white54), // Цвет подсказки
                                    border: InputBorder.none, // Без границ у поля
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Текст с описанием
                        const Text(
                          'Մեկ հավելված՝ գեղեցկության, առողջության և ֆիթնեսի ծառայությունների ամրագրման համար ողջ Հայաստանում։',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Գտիր վստահելի գեղեցկության սրահներ, կլինիկաներ, մարզասրահներ և ավելին։ Ամրագրիր ընդամենը մի քանի րոպեում՝ և վայելիր։',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Горизонтально прокручиваемые кнопки
                        SizedBox(
                          height: 50, // Высота контейнера
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal, // Горизонтальное прокручивание
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: 6, // Количество кнопок
                            separatorBuilder: (_, __) => const SizedBox(width: 16), // Отступы между кнопками
                            itemBuilder: (context, index) {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ծառայությունների ոլորտներ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SimpleSlider(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SiriusInfoWidgets(),
            )          ],
        ),
      ), index: 0,
    );
  }
}
