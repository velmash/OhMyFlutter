import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:me_calculator/core/router/router_config.dart';
import 'package:me_calculator/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_calculator/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider);
    final router = AppRouter(authNotifier).router;

    return MaterialApp.router(
      title: "Mesangy",
      routerConfig: router,
    );
  }
}
