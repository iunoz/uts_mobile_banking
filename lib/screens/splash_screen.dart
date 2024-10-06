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
        mainAxisAlignment: MainAxisAlignment.center, // Memastikan berada di tengah vertikal
        children: [
          Expanded( // Gunakan Expanded agar widget dapat menyesuaikan ruang yang tersedia
            child: Center(
              child: Lottie.asset(
                'assets/animations/Animation - 1728215250294.json',
                fit: BoxFit.contain, // Memastikan animasi menyesuaikan ukuran layar
              ),
            ),
          ),
        ],
      ),
      nextScreen: const LoginScreen(),
      splashIconSize: MediaQuery.of(context).size.height * 0.5, // Ukuran splash sekitar setengah layar
      backgroundColor: Colors.white, // Warna latar belakang bisa disesuaikan
    );
  }
}
