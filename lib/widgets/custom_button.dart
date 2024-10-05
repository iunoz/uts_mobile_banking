import 'package:flutter/material.dart';
import 'page_transition.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Widget destination;
  final Color color;
  final IconData? icon; //opsional
  final Color? textColor;
  final double? textSize;
  final Color? iconColor;
  final double? iconSize;
  final double? borderRadius;
  final VoidCallback? customNavigation;
  final PageTransitionType? transitionType;
  final bool usePushReplacement;
  final bool usePushAndRemoveUntil;

  const CustomButton({
    required this.buttonText,
    required this.destination,
    required this.color,
    this.icon, //opsional
    this.textColor,
    this.textSize,
    this.iconColor,
    this.iconSize,
    this.borderRadius,
    this.customNavigation,
    this.transitionType,
    this.usePushReplacement = false,
    this.usePushAndRemoveUntil = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: customNavigation ??
          () {
            Route route = _buildPageRoute(context, destination);
            if (usePushAndRemoveUntil) {
              Navigator.pushAndRemoveUntil(
                context,
                route,
                (Route<dynamic> route) => false, //hapus semua routes sebelumnya
              );
            } else if (usePushReplacement) {
              Navigator.pushReplacement(context, route);
            } else {
              Navigator.push(context, route);
            }
          },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: iconSize ?? 30,
              color: iconColor ?? Colors.black,
            ),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: textSize ?? 14,
              color: textColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //fungsi untuk membuat transisi halaman berdasarkan `transitionType`
  Route _buildPageRoute(BuildContext context, Widget page) {
    if (transitionType != null) {
      return PageTransition(
        page: page,
        transitionType: transitionType!, //menggunakan transisi yang dipilih
      );
    } else {
      return MaterialPageRoute(builder: (context) => page); //transisi default
    }
  }
}
