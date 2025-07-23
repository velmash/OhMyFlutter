import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // 회원 탈퇴 함수
  Future<void> _deleteAccount(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('로그인된 사용자가 없습니다.')),
      );
      return;
    }

    try {
      await user.delete();
      // 탈퇴 성공 시 AuthWrapper가 자동으로 로그인 화면으로 보냅니다.
      // 따라서 별도의 화면 이동 코드는 필요 없습니다.
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('회원 탈퇴가 완료되었습니다.')),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      // 사용자가 재로그인해야 하는 경우
      if (e.code == 'requires-recent-login') {
        message = '보안을 위해 재로그인이 필요합니다. 다시 로그인 후 시도해주세요.';
      } else {
        message = '회원 탈퇴에 실패했습니다: ${e.code}';
      }
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('알 수 없는 오류가 발생했습니다: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 현재 로그인된 사용자 정보 가져오기
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로그인된 사용자 이메일 표시
            Text(
              '로그인 성공! \n${user?.email ?? '사용자 정보 없음'}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            // 회원 탈퇴 버튼
            ElevatedButton(
              onPressed: () => _deleteAccount(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // 위험한 작업을 나타내는 색상
              ),
              child: const Text('회원 탈퇴'),
            ),
          ],
        ),
      ),
    );
  }
}
