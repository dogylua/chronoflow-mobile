import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_list_tile.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import 'qr_generator_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          // Device Authentication Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Device Authentication',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          CustomListTile(
            leading: const Icon(Icons.qr_code),
            title: 'Generate QR Code',
            subtitle: 'Authenticate another device',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const QRGeneratorScreen(),
                ),
              );
            },
          ),
          const Divider(),
          // Account Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          CustomListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: 'Sign Out',
            subtitle: 'Sign out of your account',
            onTap: () {
              context.read<SettingsBloc>().add(const SettingsEvent.signOut());
            },
          ),
        ],
      ),
    );
  }
}
