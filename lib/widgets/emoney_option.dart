import 'package:flutter/material.dart';

class EmoneyOption extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap; // Callback untuk menangani onTap

  const EmoneyOption({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Memanggil callback ketika diklik
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 177, 235, 229),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal[600]),
            const SizedBox(height: 10),
            Text(name, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
