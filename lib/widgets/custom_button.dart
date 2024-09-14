import 'package:flutter/material.dart';
import '../screens/changecard_screen.dart'; // Import halaman ChangeCardScreen

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigasi ke halaman ChangeCardScreen saat tombol ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangeCardScreen()),
        );
      },
      child: const Text('Go to Change Card Screen'), // Teks di tombol
    );
  }
}
