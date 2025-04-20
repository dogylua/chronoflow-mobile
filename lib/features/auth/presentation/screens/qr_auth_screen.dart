import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_overlay.dart';
import '../widgets/qr_scanner_overlay.dart';
import '../../domain/services/qr_code_service.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

/// A screen that allows users to scan QR codes.
///
/// This screen provides a camera view with QR code scanning capabilities.
/// It handles QR code detection, validation, and error states appropriately.
class QRAuthScreen extends StatefulWidget {
  const QRAuthScreen({super.key});

  @override
  State<QRAuthScreen> createState() => _QRAuthScreenState();
}

class _QRAuthScreenState extends State<QRAuthScreen> {
  final MobileScannerController _scannerController = MobileScannerController();
  bool _isLoading = false;
  String? _lastError;

  @override
  void initState() {
    super.initState();
    _initializeScanner();
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  Future<void> _initializeScanner() async {
    try {
      await _scannerController.start();
    } catch (e) {
      if (mounted) {
        _showError('Failed to initialize camera: ${e.toString()}');
      }
    }
  }

  Future<void> _handleQRCode(String code) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _lastError = null;
    });

    try {
      final (authCode, error) = QRCodeService.validateQRCode(code);
      if (error != null) {
        _showError(error);
        return;
      }

      if (authCode == null) {
        _showError('Invalid QR code format');
        return;
      }

      // Add the authentication event to the bloc
      if (!mounted) return;
      context.read<AuthBloc>().add(AuthEvent.authenticateWithQRCode(authCode));
    } catch (e) {
      _showError('Failed to process QR code: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showError(String message) {
    if (!mounted) return;

    setState(() => _lastError = message);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Theme.of(context).colorScheme.onError,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void _handleBack() {
    // Always go to auth screen when back is pressed
    context.go('/auth');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (_, __, ___) {
            // Navigate to home screen when authenticated
            context.go('/home');
          },
          error: (message) {
            _showError(message);
          },
          orElse: () {},
        );
      },
      child: WillPopScope(
        onWillPop: () async {
          _handleBack();
          return false;
        },
        child: LoadingOverlay(
          isLoading: _isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Scan QR Code'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _handleBack,
              ),
            ),
            body: Column(
              children: [
                if (_lastError != null)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _lastError!,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onErrorContainer,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() => _lastError = null);
                          },
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: QRScannerOverlay(
                    controller: _scannerController,
                    onQRCodeDetected: _handleQRCode,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
