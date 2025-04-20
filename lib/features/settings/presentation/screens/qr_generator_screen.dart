import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/config/env.dart';
import '../../../../core/widgets/loading_overlay.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/animations/fade_animation.dart';
import 'dart:async';

class QRGeneratorScreen extends StatefulWidget {
  const QRGeneratorScreen({super.key});

  @override
  State<QRGeneratorScreen> createState() => _QRGeneratorScreenState();
}

class _QRGeneratorScreenState extends State<QRGeneratorScreen> {
  String? _qrCode;
  bool _isLoading = false;
  Timer? _qrRefreshTimer;

  @override
  void initState() {
    super.initState();
    _generateQRCode();
  }

  @override
  void dispose() {
    _qrRefreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _generateQRCode() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);
    try {
      final token = await Env.getAccessToken();
      if (token == null) {
        throw Exception('Not authenticated');
      }

      final response = await http.get(
        Uri.parse(Env.getApiUrl(Env.apiQrCodePath)),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _qrCode = data['code'];
          _isLoading = false;
        });

        // Cancel existing timer if any
        _qrRefreshTimer?.cancel();
        // Set up new timer for auto-refresh
        _qrRefreshTimer = Timer(const Duration(minutes: 4), () {
          if (mounted) {
            _generateQRCode();
          }
        });
      } else {
        throw Exception('Failed to generate QR code');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted && _isLoading) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Generator'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  child: Text(
                    'Scan this QR code with another device to authenticate',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                if (_qrCode != null)
                  FadeAnimation(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: QrImageView(
                        data: _qrCode!,
                        version: QrVersions.auto,
                        size: 200.0,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                const SizedBox(height: 32),
                FadeAnimation(
                  child: CustomButton(
                    onPressed: _generateQRCode,
                    child: const Text('Generate New QR Code'),
                  ),
                ),
                const SizedBox(height: 16),
                FadeAnimation(
                  child: Text(
                    'QR code refreshes every 4 minutes',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
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
