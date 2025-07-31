import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:me_calculator/features/auth/views/login_view.dart';
import 'package:me_calculator/main_bottom_bar.dart';
import 'package:me_calculator/presentation/home/pages/home_view.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const LoginView();
          }
          return const MainBottomBar();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
