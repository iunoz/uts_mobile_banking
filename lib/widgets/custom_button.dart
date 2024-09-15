import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText; // Parameter untuk teks tombol
  final Widget destination; // Parameter untuk halaman tujuan

  // Constructor untuk menerima teks tombol dan tujuan navigasi
  CustomButton({required this.buttonText, required this.destination});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Pindah ke halaman yang diinginkan sesuai tombol yang ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Text(buttonText), // Teks di tombol
    );
  }
}
