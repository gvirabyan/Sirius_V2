import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled9/screens/splash_screen.dart'; // Подключаем SplashScreen
import 'package:untitled9/screens/sign_up_screen.dart';
import 'package:untitled9/screens/user_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // Переход на SplashScreen
        '/home': (context) => const UserHomePage(), // Главная страница
        '/signup': (context) => const SignUpScreen(), // Экран регистрации
      },
    );
  }
}
