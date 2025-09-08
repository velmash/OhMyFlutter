import 'package:flutter/material.dart';
import 'package:navigation/screen/default_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int number;
  const RouteOneScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // 시스템에서 제공하는 뒤로가기 버튼 막기 (Appbar, 드래그, 안드로이드 뒤로가기 버튼)
      canPop: false,
      child: DefaultLayout(
        title: "Route One Screen",
        children: [
          Text("arguments: $number", textAlign: TextAlign.center),

          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop(456);
            },
            child: const Text('Pop'),
          ),

          OutlinedButton(
            onPressed: () {
              Navigator.of(context).maybePop(456);
            },
            child: const Text('Maybe Pop'),
          ),

          OutlinedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
            },
            child: const Text('Can Pop'),
          ),

          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return RouteTwoScreen();
                  },
                  settings: RouteSettings(arguments: 789),
                ),
              );
            },
            child: const Text('Route Two Screen'),
          ),
        ],
      ),
    );
  }
}
