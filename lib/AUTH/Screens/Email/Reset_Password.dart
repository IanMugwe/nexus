import 'package:flutter/material.dart';
import 'package:nexus/AUTH/Screens/Common/auth_widgets.dart';
import 'package:nexus/AUTH/Screens/Email/New_Password.dart';

class ResetPasswordInfoScreen extends StatelessWidget {
  final String email;

  const ResetPasswordInfoScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Check your email',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'We\'ve sent a password reset link to\n$email',
                  style: const TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'If you don\'t see it, check your spam folder or try again.',
                  style: TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  text: 'Open mail app',
                  onPressed: () {
                    // TODO: Deep‑link to mail app if desired
                  },
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  text: 'I have the code',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateNewPasswordPage(email: email),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Didn’t get the email? Try again',
                      style: TextStyle(
                        color: Color(0xFFB8A06A),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
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

