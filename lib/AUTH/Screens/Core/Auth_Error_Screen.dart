import 'package:flutter/material.dart';
import 'package:nexus/AUTH/Screens/Common/auth_widgets.dart';

class AuthErrorScreen extends StatelessWidget {
  final String? title;
  final String? message;

  const AuthErrorScreen({
    super.key,
    this.title,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedTitle = title ?? 'Something went wrong';
    final resolvedMessage = message ??
        'We could not complete your request right now. Please try again in a moment.';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.error.withOpacity(0.08),
                  ),
                  child: const Icon(
                    Icons.error_outline,
                    color: Color(0xFFFF6B6B),
                    size: 50,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  resolvedTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  resolvedMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  text: 'Try again',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Back to start',
                    style: TextStyle(
                      color: Color(0xFFB8A06A),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
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
