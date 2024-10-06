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
              ? Colors.grey.shade100.withOpacity(0.8)
              : Colors.grey.shade100.withOpacity(0.8),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF7EBDA6)
                : Colors.grey.shade100.withOpacity(0.8),
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
