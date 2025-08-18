import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [_Top(), _Bottom()]),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          Text("U&I", style: textTheme.displayLarge),
          Text("우리 처음 만난날", style: textTheme.displayMedium),

          Text("2023-11-23", style: textTheme.bodyMedium),
          IconButton(
            onPressed: () {},
            iconSize: 60,
            color: Colors.red,
            icon: Icon(Icons.favorite),
          ),
          Text("D+1", style: textTheme.displayMedium),
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png'));
  }
}
