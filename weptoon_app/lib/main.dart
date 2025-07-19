import 'package:flutter/material.dart';
import 'package:weptoon_app/screens/home_screen.dart';
import 'package:weptoon_app/services/api_service.dart';

void main() {
  print(ApiService().getTodaysToons());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
