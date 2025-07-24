import 'package:flutter/material.dart';
import 'package:me_calculator/screens/sign_in_screen.dart';
import 'package:me_calculator/widgets/login/_login_actions.dart';
import 'package:me_calculator/widgets/login/_login_form.dart';
import 'package:me_calculator/widgets/login/_login_header.dart';
import 'package:me_calculator/widgets/login/_reset_password_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  void _showResetPwDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (BuildContext dialogContext) => const ResetPasswordDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginHeader(),
            LoginForm(onForgotPassword: _showResetPwDialog),
            const SizedBox(height: 20),
            LoginActions(onSignUp: _navigateToSignUp),
          ],
        ),
      ),
    );
  }
}
