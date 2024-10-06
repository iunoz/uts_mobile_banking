import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLottie extends StatelessWidget {
  final String animationPath; // Path to assets/animations
  final double? width;
  final double? height;

  const AnimationLottie({
    super.key,
    required this.animationPath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double responsiveWidth = width ?? MediaQuery.of(context).size.width;
    final double responsiveHeight =
        height ?? MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        width: responsiveWidth,
        height: responsiveHeight,
        child: FittedBox(
          fit: BoxFit.contain, // Ensure the animation scales properly
          child: Lottie.asset(
            animationPath,
            width: responsiveWidth, // Apply the proper width
            height: responsiveHeight, // Apply the proper height
            fit: BoxFit.contain, // Keep the animation within bounds
            repeat: false,
          ),
        ),
      ),
    );
  }
}
