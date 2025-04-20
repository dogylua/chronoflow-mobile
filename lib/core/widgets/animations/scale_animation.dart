import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final bool animate;
  final double begin;
  final double end;

  const ScaleAnimation({
    super.key,
    required this.child,
    this.duration = AppTheme.animationDuration,
    this.animate = true,
    this.begin = 0.95,
    this.end = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: duration,
      scale: animate ? end : begin,
      child: child,
    );
  }
}
