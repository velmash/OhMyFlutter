import 'package:flutter/material.dart';

class AddCharacterView extends StatelessWidget {
  const AddCharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "캐릭터 추가",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(child: Text("캐릭터 추가 화면 구현 해야함")),
    );
  }
}
