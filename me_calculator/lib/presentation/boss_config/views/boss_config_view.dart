import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BossConfigView extends ConsumerStatefulWidget {
  const BossConfigView({super.key});

  @override
  ConsumerState<BossConfigView> createState() => _BossConfigState();
}

class _BossConfigState extends ConsumerState<BossConfigView> {
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
