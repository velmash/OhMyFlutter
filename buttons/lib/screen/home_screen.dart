import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: null, //() {},
              style: ElevatedButton.styleFrom(
                //배경색
                backgroundColor: Colors.red,
                disabledBackgroundColor: Colors.grey,
                //배경 위 색
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.red,
                //그림자색
                shadowColor: Colors.green,
                elevation: 10,
                textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                padding: EdgeInsets.all(32),
                side: BorderSide(color: Colors.black, width: 4),
                // minimumSize: Size(200, 150),
                // maximumSize: Size(100, 150),
                fixedSize: Size(100, 150),
              ),

              child: const Text('Elevated Button'),
            ),

            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    // pressed: 눌렀을 때
                    // disabled: 못쓸 때
                    //focused: 텍스트필드 포커스됐을때
                    WidgetStatePropertyAll(Colors.yellow),
              ),
              child: const Text('Outlined Button'),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.red;
                  }
                  return Colors.black;
                }),
              ),
              child: const Text('Text Button'),
            ),

            OutlinedButton(
              onPressed: () {},
              // style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              // style: OutlinedButton.styleFrom(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8))),
              style: OutlinedButton.styleFrom(
                shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Outlined Button'),
            ),
          ],
        ),
      ),
    );
  }
}
