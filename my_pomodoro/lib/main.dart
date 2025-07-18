import 'package:flutter/material.dart';
import 'package:my_pomodoro/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE7626C),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Color(0xff232B55)),
        ),
        cardColor: const Color(0xffF4EDDB),
      ),
      home: const Scaffold(body: HomeScreen()),
    );
  }
}
