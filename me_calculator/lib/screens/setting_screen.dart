import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

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
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            spacing: 0,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue, // 테두리 색상
                    width: 2, // 테두리 두께
                  ),
                  borderRadius: BorderRadius.circular(12), // 둥근 모서리
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "로그인 계정 : ${user?.email ?? "정보 없음"}",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 20),

              InkWell(
                onTap: signOut,
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 16),
                      Text("로그아웃", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () => _deleteAccount(context),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Icon(Icons.person_remove),
                      SizedBox(width: 16),
                      Text("회원탈퇴", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
