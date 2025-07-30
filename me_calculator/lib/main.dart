import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:me_calculator/features/auth/views/auth_wrapper.dart';
import 'package:me_calculator/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {'/': (context) => const AuthWrapper()});
  }
}
