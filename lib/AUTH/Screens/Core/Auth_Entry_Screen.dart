import 'package:flutter/material.dart';
import 'package:nexus/AUTH/Screens/Email/Login_Register_Screen.dart';

class AuthEntryScreen extends StatelessWidget {
  const AuthEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.primary,
              colorScheme.secondary,
            ],
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
                  child: Image.asset('lib/assets/logo.png', fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),

              // Welcome Text Section
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.orangeAccent, Colors.blue],
                ).createShader(bounds),
                child: const Text(
                  'Event App',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const Spacer(flex: 3),

              // Bottom Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.blue],
                        ),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Material(
                        color: const Color.fromRGBO(0, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor:
                                  Colors.transparent, // allows rounded corners
                              builder: (context) => SizedBox(
                                height:
                                    MediaQuery.of(context).size.height *
                                    0.75, // 75% height
                                child: LoginRegisterScreen(
                                  isLogin: true,
                                ), // your extracted sheet
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(28),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C1810),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
