import 'package:flutter/material.dart';

class EmoneyOption extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final bool isSelected;
  final String imagePath;
  final Icon? icon;

  const EmoneyOption({
    super.key,
    required this.name,
    required this.onTap,
    required this.imagePath,
    this.isSelected = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // callback
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 192, 248, 214)
              : const Color.fromARGB(255, 192, 248, 214),
          border: Border.all(
            color: isSelected
                ? Colors.black
                : const Color.fromARGB(
                    255, 192, 248, 214), // border jika dipilih
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            Image.asset(
              imagePath,
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
