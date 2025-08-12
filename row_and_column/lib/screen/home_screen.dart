import 'package:flutter/material.dart';
import 'package:row_and_column/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // children: colors.map((e) => Container(height: 50, width: 50, color: e)).toList(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: colors.map((e) => Container(width: 50, height: 50, color: e)).toList(),
              ),

              Container(child: Container(height: 50, width: 50, color: Colors.orange)),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: colors.map((e) => Container(width: 50, height: 50, color: e)).toList(),
              ),

              Container(child: Container(height: 50, width: 50, color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
