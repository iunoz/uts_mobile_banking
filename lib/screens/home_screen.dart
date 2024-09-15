import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/screens/topupemoney_screen.dart';
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol untuk ChangeCardScreen
            CustomButton(
              buttonText: 'Change Card',
              destination: ChangeCardScreen(),
              color: Color.fromARGB(255, 192, 248, 214),
            ),
            SizedBox(height: 20), // jarak antar tombol
            // Tombol untuk NotificationScreen
            CustomButton(
              buttonText: 'Notifications',
              destination: NotificationScreen(),
              color: Color.fromARGB(255, 192, 248, 214),
            ),
            SizedBox(height: 20),
            // Tombol untuk ProfileScreen
            CustomButton(
              buttonText: 'Profile',
              destination: ProfileScreen(),
              color: Color.fromARGB(255, 192, 248, 214),
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Balance',
              destination: BalanceScreen(),
              color: Color.fromARGB(255, 192, 248, 214),
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Top Up E-Money',
              destination: TopupemoneyScreen(),
              color: Color.fromARGB(255, 192, 248, 214),
            ),
          ],
        ),
      ),
    );
  }
}
