import 'package:flutter/material.dart';
import 'package:nexus/AUTH/Screens/Common/auth_widgets.dart';

class BiometricPromptScreen extends StatelessWidget {
  final String? reason;

  const BiometricPromptScreen({
    super.key,
    this.reason,
  });

  @override
  Widget build(BuildContext context) {
    final description = reason ??
        'Confirm it’s really you using Face ID or your fingerprint.';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.1),
                        Colors.orange.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.fingerprint,
                    size: 80,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Confirm your identity',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  text: 'Use biometrics',
                  onPressed: () {
                    // TODO: Trigger platform biometric prompt
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Use password instead',
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
