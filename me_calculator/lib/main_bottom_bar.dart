import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainBottomBar extends StatelessWidget {
  final Widget child; // ShellRoute에서 전달받는 자식 위젯

  const MainBottomBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child, // 현재 선택된 페이지 표시
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        selectedItemColor: Colors.blue,
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  // 현재 경로에 따라 선택된 인덱스 계산
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).fullPath ?? '';

    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/settings')) {
      return 1;
    }
    return 0;
  }

  // 탭 선택 시 해당 경로로 이동
  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/settings');
        break;
    }
  }
}
