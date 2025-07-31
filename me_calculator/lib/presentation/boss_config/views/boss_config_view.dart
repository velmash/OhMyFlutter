import 'package:flutter/material.dart';

class BossConfigView extends StatelessWidget {
  const BossConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "보스 설정",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(child: Text("보스 선택 구현 필요")),
    );
  }
}
