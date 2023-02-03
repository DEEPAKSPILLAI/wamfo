import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
   final String buttonText1;
  final String buttonText;
  final void Function() buttonAction;
  BlueButton({
    required this.buttonText,
    required this.buttonAction,
     required this.buttonText1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        height: 70,
        width: 50,
        // padding: EdgeInsets.only(top: 5),
        decoration:  BoxDecoration(
          color: Color(0xff00249C),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(0.0, 0.75),
              blurRadius: 2
            )
          ]
            // image: DecorationImage(
            //     image: AssetImage('assets/common/blue_color_button.png'),
            //     fit: BoxFit.fill)
            ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                buttonText1,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
