import 'package:flutter/material.dart';
import 'package:navigation/screen/default_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(
      title: 'Route Two Screen',
      children: [
        Text(arguments.toString(), textAlign: TextAlign.center),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: const Text('Pop'),
        ),

        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 1111);
          },
          child: const Text("Push Route Three"),
        ),

        OutlinedButton(
          onPressed: () {
            /// 최초 - [home, one, two]
            /// push - [home, one two, three]
            /// pushR - [home , one, three]
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return RouteThreeScreen();
                },
              ),
            );
          },
          child: Text("Push Replacement"),
        ),

        OutlinedButton(
          onPressed: () {
            /// 최초 - [home, one, two]
            /// push - [home, one two, three]
            /// pushR - [home , one, three]
            Navigator.of(context).pushReplacementNamed('/three', arguments: 1111);
          },
          child: Text("Push ReplacementNamed"),
        ),

        OutlinedButton(
          onPressed: () {
            /// 최초 - [home, one, two]
            /// push - [home, one two, three]
            /// pushR - [home , one, three]
            Navigator.of(context).pushNamedAndRemoveUntil('/three', (route) {
              // 만약 삭제 할거면 (route stack) false 반환
              // 만약 삭제 안할거면 true 반환
              // '/' 이름만 빼고 스택에서 전체 삭제
              return route.settings.name == '/';
            }, arguments: 1111);
          },
          child: Text("Push ReplacementNamed"),
        ),
      ],
    );
  }
}
