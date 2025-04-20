import 'package:flutter/material.dart';
import '../router/custom_page_route.dart';

class Navigation {
  static void push(BuildContext context, Widget page) {
    Navigator.push(
      context,
      CustomPageRoute(child: page),
    );
  }

  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      CustomPageRoute(child: page),
    );
  }

  static void pushAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      CustomPageRoute(child: page),
      (route) => false,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void popUntil(BuildContext context, String routeName) {
    Navigator.popUntil(
      context,
      (route) => route.settings.name == routeName,
    );
  }

  static void showSnackBar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static void showDialog(
    BuildContext context,
    Widget dialog,
  ) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => dialog,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
} 