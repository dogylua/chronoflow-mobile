import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final Duration duration;

  CustomPageRoute({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
