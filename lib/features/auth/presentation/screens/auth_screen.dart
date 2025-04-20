import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:developer' as developer;
import '../../../../core/widgets/animations/fade_animation.dart';
import '../../../../core/widgets/animations/slide_animation.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/loading_overlay.dart';
import '../../../../core/router/custom_page_route.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/validation.dart';
import '../../../../core/utils/device_info.dart';
import '../../../../core/utils/location.dart';
import '../../../../core/utils/network.dart';
import '../../../../core/utils/storage.dart';
import '../../../../core/utils/time.dart';
import '../../../../core/utils/ui.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../bloc/auth_event.dart';
import '../widgets/auth_option_card.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    // Check authorization status when screen loads
    _checkAuthorization();
  }

  void _checkAuthorization() {
    if (!mounted) return;
    context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (accessToken, refreshToken, expiresAt) {
            developer.log(
                'Authenticated state received in AuthScreen, navigating to home');
            if (context.mounted) {
              context.go('/home');
            }
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
          child: Scaffold(
            body: Stack(
              children: [
                // Background
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                  ),
                ),
                // Content
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeAnimation(
                                child: Text(
                                  'Welcome to ChronoFlow',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              FadeAnimation(
                                delay: const Duration(milliseconds: 200),
                                child: Text(
                                  'Track your habits, achieve your goals',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.white70,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 48),
                              // Auth Options
                              SlideAnimation(
                                child: AuthOptionCard(
                                  title: 'Register Device',
                                  subtitle: 'Get started with your device',
                                  icon: Icons.device_hub,
                                  onTap: () {
                                    developer
                                        .log('Register device button pressed');
                                    context
                                        .read<AuthBloc>()
                                        .add(const AuthEvent.registerDevice());
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              SlideAnimation(
                                delay: const Duration(milliseconds: 200),
                                child: AuthOptionCard(
                                  title: 'QR Authentication',
                                  subtitle:
                                      'Scan or generate QR code for authentication',
                                  icon: Icons.qr_code_scanner,
                                  onTap: () {
                                    developer.log('QR auth button pressed');
                                    context.go('/qr-auth');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
