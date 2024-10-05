import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLottie extends StatelessWidget {
  final String animationPath; //path ke assets/animations
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
      child: Lottie.asset(
        animationPath,
        width: responsiveWidth,
        height: responsiveHeight,
        fit: BoxFit.cover,
        repeat: false,
      ),
    );
  }
}
