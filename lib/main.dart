import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import file SplashScreen yang baru

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SUMI Mobile Bank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
        ),
      ),
      // Mengatur SplashScreen sebagai halaman awal sebelum LoginScreen
      home: const SplashScreen(), // Menambahkan SplashScreen di sini
    );
  }
}
