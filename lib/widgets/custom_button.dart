import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/screens/profile_screen.dart';
import '../screens/changecard_screen.dart'; // Import ChangeCardScreen
import '../screens/profile_screen.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, // Center the buttons vertically
      children: [
        ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman ChangeCardScreen saat tombol ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChangeCardScreen()),
            );
          },
          child: const Text('Go to Change Card Screen'), // Teks di tombol
        ),
        const SizedBox(height: 20), // Spacing between buttons
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          child: const Text('Profile'),
        ),
      ],
    );
  }
}
