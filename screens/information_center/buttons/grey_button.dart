import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  final String greyButtonText;
  final void Function() greybuttonAction;
  GreyButton({
    required this.greyButtonText,
    required this.greybuttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: greybuttonAction,
        child: Container(
          height: 30,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/common/grey_button.png'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Text(
              greyButtonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff760000),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
