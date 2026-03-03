import 'package:flutter/material.dart';

class AuthEntryScreen extends StatelessWidget {
  const AuthEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Colors.blue, Color(0xFFFF8800)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Logo Section
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(),
                  //Add your logo
                  child: Image.asset(
                    'lib/assets/logo.png',
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
