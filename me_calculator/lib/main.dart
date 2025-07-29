import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:me_calculator/features/auth/views/auth_wrapper.dart';
import 'package:me_calculator/features/home/viewmodels/home_viewmodel.dart';
import 'package:me_calculator/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Firebase Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {'/': (context) => const AuthWrapper()},
      ),
    );
  }
}
