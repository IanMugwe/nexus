import 'package:flutter/material.dart';
import 'package:nexus/AUTH/Screens/Common/auth_widgets.dart';

class AccountLockedScreen extends StatelessWidget {
  final String? reason;

  const AccountLockedScreen({
    super.key,
    this.reason,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedReason = reason ??
        'For your security, we\'ve temporarily locked your account after several unsuccessful attempts.';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 56),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange.withOpacity(0.08),
                  ),
                  child: const Icon(
                    Icons.lock_outline,
                    size: 64,
                    color: Color(0xFFFFB800),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Account locked',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  resolvedReason,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'You can try again later or contact support if this wasn\'t you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  text: 'Try again later',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to help / support
                  },
                  child: const Text(
                    'Contact support',
                    style: TextStyle(
                      color: Color(0xFFB8A06A),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
