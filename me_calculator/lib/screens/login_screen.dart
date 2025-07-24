import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:me_calculator/screens/sign_in_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      String message;
      if (e.code == 'user-not-found') {
        message = '등록되지 않은 이메일입니다.';
      } else if (e.code == 'wrong-password') {
        message = '잘못된 비밀번호입니다.';
      } else {
        message = '로그인에 실패했습니다. 다시 시도해주세요.';
      }
      if (!mounted) return;
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      if (!mounted) return;
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text("오류가 발생했습니다: ${e.toString()}")),
      );
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  void _showMyDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible:
          false, // 사용자가 다이얼로그 바깥을 탭하여 닫을 수 없도록 설정 (true로 하면 닫을 수 있음)
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("암호 초기화"),
          content: SingleChildScrollView(
            // 내용이 길어질 경우 스크롤 가능하게
            child: ListBody(
              // 여러 위젯을 세로로 배치할 때 유용
              children: const <Widget>[
                Text('여기에 다이얼로그 내용을 작성합니다.'),
                Text('예를 들어, 이메일 입력 필드를 넣을 수 있습니다.'),
                // TextField(
                //   decoration: InputDecoration(labelText: '이메일'),
                // ),
              ],
            ),
          ),
          actions: <Widget>[
            // 다이얼로그 하단의 버튼들
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // 다이얼로그 닫기
              },
            ),
            TextButton(
              child: const Text('초기화'),
              onPressed: () async {
                try {
                  // await FirebaseAuth.instance.sendPasswordResetEmail(
                  //   email: "hyengchan@gmail.com",
                  // );
                } on FirebaseAuthException catch (e) {}

                // 여기에 확인 버튼을 눌렀을 때의 로직을 추가합니다.
                // 예를 들어, 입력된 이메일로 비밀번호 재설정 이메일을 보내는 함수 호출
                Navigator.of(dialogContext).pop(); // 다이얼로그 닫기
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/mushmom.gif"),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "로그인",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "계속하시려면 로그인 해주세요",
                    style: TextStyle(fontSize: 12),
                  ),
                ),

                SizedBox(height: 20),

                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    labelText: '이메일을 입력해주세요.',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    labelText: '암호를 입력해주세요.',
                  ),
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => _showMyDialog(context),
                    child: Text(
                      "로그인 정보를 잊으셨나요?",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                GestureDetector(
                  onTap: _isLoading ? null : _signIn,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      // border: Border.all(color: Colors.blue, width: 2),
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: _isLoading ? null : _navigateToSignUp,
                  child: Text(
                    "아직 회원이 아니신가요?",
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
