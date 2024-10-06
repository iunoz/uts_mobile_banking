import 'dart:async';
import 'package:flutter/material.dart';

class AutomaticAds extends StatefulWidget {
  final List<String> imagePaths;
  final int slideDuration;

  const AutomaticAds({
    super.key,
    required this.imagePaths, //list buat tiap image paths
    this.slideDuration = 3, //default durasi slide adalah 3sec
  });

  @override
  // ignore: library_private_types_in_public_api
  _AutomaticAdsState createState() => _AutomaticAdsState();
}

class _AutomaticAdsState extends State<AutomaticAds> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(Duration(seconds: widget.slideDuration), (Timer timer) {
      if (_currentPage < widget.imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double imageHeight = 150;
    double imageWidth;

    //perbedaan untuk jenis phone
    if (screenWidth <= 360) {
      //small phone
      imageWidth = screenWidth * 0.95;
    } else if (screenWidth <= 480) {
      //medium phone
      imageWidth = screenWidth * 0.9;
    } else {
      //large phone
      imageWidth = screenWidth * 0.85;
    }

    return SizedBox(
      height: imageHeight,
      child: PageView(
        controller: _pageController,
        children: widget.imagePaths
            .map(
                (imagePath) => _buildAdItem(imagePath, imageWidth, imageHeight))
            .toList(),
      ),
    );
  }

  Widget _buildAdItem(String imagePath, double imageWidth, double imageHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
