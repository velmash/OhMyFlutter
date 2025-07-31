import 'package:flutter/material.dart';

class LoginActions extends StatelessWidget {
  final VoidCallback onSignUp;

  const LoginActions({
    super.key,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignUp,
      child: const Text(
        "아직 회원이 아니신가요?",
        style: TextStyle(color: Colors.black54, fontSize: 16),
      ),
    );
  }
}
