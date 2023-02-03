import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final String buttonText;
  final void Function() buttonAction;
  Button2({
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: buttonAction,
        child: Container(
          height: 53.32,
          width: 219,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/common/play_button1.png'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Text(
                  buttonText,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xff010049),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
