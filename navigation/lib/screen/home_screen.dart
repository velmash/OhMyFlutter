import 'package:flutter/material.dart';
import 'package:navigation/screen/default_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Home Screen",
      children: [
        OutlinedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return RouteOneScreen(number: 20);
                },
              ),
            );

            print(result);
          },

          child: const Text('Push'),
        ),

        /*
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
        */
      ],
    );
  }
}
