import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/screens/balance_screen.dart';
import 'screens/changecard_screen.dart';
import 'widgets/custom_button.dart';
import 'screens/notification_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'), // Halaman Home
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol untuk ChangeCardScreen
            CustomButton(
              buttonText: 'Change Card Screen',
              destination: ChangeCardScreen(),
            ),
            SizedBox(height: 20), // jarak antar tombol
            // Tombol untuk NotificationScreen
            CustomButton(
              buttonText: 'Notifications',
              destination: NotificationScreen(),
            ),
            SizedBox(height: 20),
            // Tombol untuk ProfileScreen
            CustomButton(
              buttonText: 'Profile',
              destination: ProfileScreen(),
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Balance',
              destination: BalanceScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
