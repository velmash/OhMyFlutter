import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_calculator/core/router/auth_notifier.dart';
import 'package:me_calculator/main_bottom_bar.dart';
import 'package:me_calculator/presentation/add_character/add_character_view.dart';
import 'package:me_calculator/presentation/auth/views/login_view.dart';
import 'package:me_calculator/presentation/auth/views/sign_in_view.dart';
import 'package:me_calculator/presentation/boss_config/views/boss_config_view.dart';
import 'package:me_calculator/presentation/home/pages/home_view.dart';
import 'package:me_calculator/presentation/setting/views/setting_view.dart';

class AppRouter {
  final AuthNotifier authNotifier;

  AppRouter(this.authNotifier);

  late final GoRouter router = GoRouter(
    refreshListenable: authNotifier,
    initialLocation: '/home',
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = authNotifier.user != null;

      final protectedRoutes = [
        '/home',
        '/add-character',
        '/boss-config',
        '/settings',
      ];

      final isProtectedRoute = protectedRoutes.any(
        (route) => state.fullPath?.startsWith(route) ?? false,
      );

      final authRoutes = ['/login', '/sign-up'];
      final isAuthRoute = authRoutes.contains(state.fullPath);

      if (!isLoggedIn && isProtectedRoute) {
        return '/login';
      } else if (isLoggedIn && isAuthRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/sign-up',
        name: 'signUp',
        builder: (context, state) => const SignInView(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainBottomBar(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/add-character',
        name: 'addCharacter',
        builder: (context, state) => const AddCharacterView(),
      ),
      GoRoute(
        path: '/boss-config/:characterId',
        name: 'bossConfig',
        builder: (context, state) {
          final characterId = state.pathParameters['characterId']!;
          return BossConfigView();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('페이지를 찾을 수 없습니다: ${state.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('홈으로 돌아가기'),
            ),
          ],
        ),
      ),
    ),
  );
}
