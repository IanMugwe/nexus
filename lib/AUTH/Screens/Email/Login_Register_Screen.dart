import 'package:flutter/material.dart';
import 'package:nexus/AUTH/Screens/Common/auth_widgets.dart';
import 'package:nexus/AUTH/Screens/Email/Forgot_Password.dart';

class LoginRegisterScreen extends StatefulWidget {
  final bool isLogin;
  const LoginRegisterScreen({super.key, this.isLogin = true});

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen>
    with SingleTickerProviderStateMixin {
  late bool _isLogin;
  late TabController _tabController;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _rememberMe = false;
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();
    _isLogin = widget.isLogin;
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: _isLogin ? 0 : 1,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _isLogin = _tabController.index == 0;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Drag handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            // Tab Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orangeAccent, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(text: 'Login'),
                    Tab(text: 'Sign Up'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // TabBarView
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: IndexedStack(
                index: _tabController.index,
                children: [
                  _buildAuthForm(isLogin: true),
                  _buildAuthForm(isLogin: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthForm({required bool isLogin}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name field only for Sign Up
          if (!_isLogin) ...[
            const SectionLabel(text: 'Full Name'),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _nameController,
              hintText: 'John Doe',
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 20),
          ],
          // Email field
          const SectionLabel(text: 'Email Address'),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _emailController,
            hintText: 'youremail@example.com',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          // Password field
          const SectionLabel(text: 'Password'),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _passwordController,
            hintText: '••••••••',
            prefixIcon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 16),
          // Login-specific: Remember Me + Forgot Password
          if (_isLogin)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomCheckbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Remember me',
                      style: TextStyle(color: Color(0xFFB8A06A), fontSize: 14),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Forgot Password screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFFFF6B6B),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          // Sign Up-specific: Terms & Conditions
          if (!_isLogin)
            Row(
              children: [
                CustomCheckbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'I agree to the Terms & Conditions and Privacy Policy',
                    style: TextStyle(color: Color(0xFFB8A06A), fontSize: 13),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 30),
          // Primary Button
          PrimaryButton(
            text: _isLogin ? 'Log In' : 'Sign Up',
            onPressed: () {
              if (_isLogin) {
                // Handle login
              } else {
                // Handle sign up
              }
            },
          ),
          const SizedBox(height: 24),
          const SocialDivider(),
          const SizedBox(height: 24),
          const SocialButtons(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
