import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_calculator/main_bottom_bar.dart';
import 'package:me_calculator/presentation/add_character/add_character_view.dart';
import 'package:me_calculator/presentation/auth/views/auth_wrapper.dart';
import 'package:me_calculator/presentation/auth/views/login_view.dart';
import 'package:me_calculator/presentation/auth/views/sign_in_view.dart';
import 'package:me_calculator/presentation/boss_config/views/boss_config_view.dart';
import 'package:me_calculator/presentation/home/pages/home_view.dart';
import 'package:me_calculator/presentation/setting/views/setting_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (BuildContext context, GoRouterState state) {
      final user = FirebaseAuth.instance.currentUser;
      final isLoggedIn = user != null;

      final protectedRoutes = [
        '/home',
        '/add-character',
        '/boss-config',
        '/settings',
      ];

      final isProtectedRoute = protectedRoutes.any(
        (route) => state.fullPath?.startsWith(route) ?? false,
      );

      final authRoutes = ['login', '/sign-up'];
      final isAuthRoute = authRoutes.contains(state.fullPath);

      // 로그인되지 않았는데 보호된 경로에 접근하려는 경우
      if (!isLoggedIn && isProtectedRoute) {
        return '/login';
      }

      return null;
    },

    routes: [
      // 루트 경로 - AuthWrapper로 이동
      GoRoute(path: '/', builder: (context, state) => const AuthWrapper()),

      // 로그인 경로
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginView(),
      ),

      // 회원가입 경로
      GoRoute(
        path: '/sign-up',
        name: 'signUp',
        builder: (context, state) => const SignInView(),
      ),

      // 메인 바텀바 (홈, 설정)
      ShellRoute(
        builder: (context, state, child) => MainBottomBar(child: child),
        routes: [
          // 홈 경로
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),

          // 설정 경로
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

      // 보스 설정 경로 (캐릭터 ID를 파라미터로 전달)
      GoRoute(
        path: '/boss-config/:characterId',
        name: 'bossConfig',
        builder: (context, state) {
          final characterId = state.pathParameters['characterId']!;
          // return BossConfigView(characterId: characterId);
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
