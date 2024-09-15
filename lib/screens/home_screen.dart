import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'changecard_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'balance_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol untuk ChangeCardScreen
            const CustomButton(
              buttonText: 'Change Card Screen',
              destination: ChangeCardScreen(),
              color: Color.fromARGB(255, 192, 248, 214),
            ),
            const SizedBox(height: 20), // jarak antar tombol
            // Tombol untuk NotificationScreen
            CustomButton(
              buttonText: 'Notifications',
              destination: NotificationScreen(),
              color: const Color.fromARGB(255, 192, 248, 214),
            ),
            const SizedBox(height: 20),
            // Tombol untuk ProfileScreen
            const CustomButton(
              buttonText: 'Profile',
              destination: ProfileScreen(),
              color: Color.fromARGB(255, 192, 248, 214),
            ),
            const SizedBox(height: 20),
            const CustomButton(
              buttonText: 'Balance',
              destination: BalanceScreen(),
              color: Color.fromARGB(255, 192, 248, 214),
            ),
          ],
        ),
      ),
    );
  }
}
