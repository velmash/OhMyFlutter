import 'package:flutter/material.dart';

void main() {
  // 플러터 앱 실행
  runApp(
    /// Material App은 항상 최상위에 위치한다
    /// Scaffold는 바로 아래에 위치한다.
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text("윤형찬", style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );
}
