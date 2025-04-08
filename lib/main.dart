import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:untitled9/screens/sign_up_screen.dart';
import 'package:untitled9/screens/user_home_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // Загружаем .env

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserHomePage(), // Now using the separate file
    );
  }
}
