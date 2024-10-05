import 'package:flutter/material.dart';

//enum buat definisi jenis transisi
enum PageTransitionType { fade, slideLeft, slideRight }

class PageTransition extends PageRouteBuilder {
  final Widget page;
  final PageTransitionType transitionType;

  PageTransition({
    required this.page,
    required this.transitionType,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (transitionType) {
              case PageTransitionType.fade:
                return _fadeTransition(animation, child);
              case PageTransitionType.slideLeft:
                return _slideTransition(animation, child, fromLeft: true);
              case PageTransitionType.slideRight:
                return _slideTransition(animation, child, fromLeft: false);
              default:
                return child;
            }
          },
        );

  //fade
  static Widget _fadeTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  //slide(kiri atau kanan)
  static Widget _slideTransition(Animation<double> animation, Widget child,
      {required bool fromLeft}) {
    final Offset begin =
        fromLeft ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0);
    const Offset end = Offset.zero;
    var tween = Tween(begin: begin, end: end);
    var slideAnimation = animation.drive(tween);

    return SlideTransition(
      position: slideAnimation,
      child: child,
    );
  }
}
