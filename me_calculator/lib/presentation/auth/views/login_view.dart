import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_calculator/presentation/auth/views/widgets/_login_actions.dart';
import 'package:me_calculator/presentation/auth/views/widgets/_login_form.dart';
import 'package:me_calculator/presentation/auth/views/widgets/_login_header.dart';
import 'package:me_calculator/presentation/auth/views/widgets/_reset_password_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  void _navigateToSignUp() {
    // go_router로 회원가입 페이지로 이동
    context.push('/sign-up');
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
