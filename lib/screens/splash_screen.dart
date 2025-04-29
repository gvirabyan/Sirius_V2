import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _playSoundAndStart();
  }

  Future<void> _playSoundAndStart() async {
    await _audioPlayer.play(AssetSource('sounds/splash_sound.mp3'));
    _controller.forward();

    // Ждем завершения анимации, потом выполняем редирект
    await Future.delayed(const Duration(seconds: 3));

    // Получаем токен и перенаправляем
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        token != null && token.isNotEmpty ? '/home' : '/signup',
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
   // _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(

                  child: Image.asset(
                    'assets/icons/sirius_icon2.png',
                    width: 200,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
