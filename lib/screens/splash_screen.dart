import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'login_screen.dart'; // Ganti dengan screen berikutnya

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: Lottie.asset(
                'assets/animations/Animation - 1728215250294.json'),
          )
        ],
      ),
      nextScreen: const LoginScreen(),
    );
  }
}
