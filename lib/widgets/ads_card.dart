import 'package:flutter/material.dart';

class AdsCard extends StatelessWidget {
  final String imagePath; // Image path for the ad

  const AdsCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath), // Use the image asset
          fit: BoxFit.cover, // Cover the entire card
        ),
      ),
    );
  }
}
