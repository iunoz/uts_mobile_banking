import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';
import 'home_screen.dart';

class QrisScreen extends StatelessWidget {
  const QrisScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QRIS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              buttonText: 'Home',
              destination: HomeScreen(),
              color: Colors.teal,
              icon: Icons.home,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
            ),
            CustomButton(
              buttonText: 'QRIS',
              destination: QrisScreen(),
              color: Colors.teal,
              icon: Icons.qr_code,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
            ),
            CustomButton(
              buttonText: 'Notif',
              destination: NotificationScreen(),
              color: Colors.teal,
              icon: Icons.notifications,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
            ),
            CustomButton(
              buttonText: 'Profile',
              destination: ProfileScreen(),
              color: Colors.teal,
              icon: Icons.account_circle_rounded,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
            ),
          ],
        ),
      ),
    );
  }
}
