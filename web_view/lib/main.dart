import 'package:flutter/material.dart';
import 'package:web_view/screen/home_screen.dart';

void main() {
  /// Flutter 프로젝트가 실행할 준비가 완료될때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(home: HomeScreen()));
}
