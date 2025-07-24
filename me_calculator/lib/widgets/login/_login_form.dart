import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onForgotPassword;

  const LoginForm({super.key, required this.onForgotPassword});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            floatingLabelStyle: const TextStyle(
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
            floatingLabelStyle: const TextStyle(
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
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: widget.onForgotPassword,
            child: const Text(
              "로그인 정보를 잊으셨나요?",
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: _isLoading ? null : _signIn,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 50,
            child: Center(
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "로그인",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
