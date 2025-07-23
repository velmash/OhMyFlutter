import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:me_calculator/screens/home_screen.dart';
import 'package:me_calculator/screens/login_screen.dart';

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
            return const LoginScreen();
          }
          return const HomeScreen();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
