import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage("images/mushmom.gif"),
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "로그인",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "계속하시려면 로그인 해주세요",
            style: TextStyle(fontSize: 12),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
