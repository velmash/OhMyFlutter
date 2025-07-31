import 'package:flutter/material.dart';
import 'package:me_calculator/domain/entities/my_character.dart';

class CharacterCard extends StatelessWidget {
  final MyCharacter myCharacter;
  final VoidCallback? onTap;

  const CharacterCard({super.key, required this.myCharacter, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.amber[200],
          borderRadius: BorderRadius.circular(8),
        ),

        child: Center(
          child: Row(
            spacing: 10,
            children: [
              Image.network(myCharacter.imagePath),
              Column(
                spacing: 0,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(myCharacter.nickName),
                  SizedBox(height: 10),
                  Text("10,000,000 메소"),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.amber[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
