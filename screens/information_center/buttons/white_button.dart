import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final String whiteButtonText;
  final void Function() whiteButtonAction;
  WhiteButton({
    required this.whiteButtonText,
    required this.whiteButtonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: whiteButtonAction,
        child: Container(
          height: 30,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/common/white_button.png'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Text(
              whiteButtonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
