import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Widget destination;
  final Color color;
  final IconData? icon; //opsional
  final Color? textColor;
  final Color? iconColor;
  final bool usePushReplacement;
  final bool usePushAndRemoveUntil;

  const CustomButton({
    required this.buttonText,
    required this.destination,
    required this.color,
    this.icon, //opsional
    this.textColor,
    this.iconColor,
    this.usePushReplacement = false,
    this.usePushAndRemoveUntil = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (usePushAndRemoveUntil) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => destination),
            (Route<dynamic> route) => false, //hapus semua routes sebelumnya
          );
        } else if (usePushReplacement) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 36,
              color: iconColor ?? Colors.black,
            ),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 14,
              color: textColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
