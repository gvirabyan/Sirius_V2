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
                  const Positioned.fill(
                    child: Image(
                      image: AssetImage('assets/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Overlay
                  Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  // Foreground Content
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Search bar
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white70),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, color: Colors.white70),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText:
                                        'Search for salons, clinics, trainers, treatments...',
                                    hintStyle: TextStyle(color: Colors.white54),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'BEAUTY & SPA',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'GYM & FITNESS',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
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
                    'EXPLORE OUR SERVICE CATEGORIES',
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
