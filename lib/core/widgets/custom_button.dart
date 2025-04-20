import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'animations/scale_animation.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final bool isLoading;
  final bool isDisabled;
  final bool animate;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
    this.isLoading = false,
    this.isDisabled = false,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      animate: animate,
      child: SizedBox(
        height: height ?? 48,
        width: width,
        child: ElevatedButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            foregroundColor: foregroundColor ?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppTheme.borderRadiusM),
            ),
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingM,
                  vertical: AppTheme.spacingS,
                ),
            elevation: 0,
          ),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
