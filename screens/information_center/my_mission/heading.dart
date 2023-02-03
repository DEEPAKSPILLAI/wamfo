import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String heading;
  Heading({required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Text(
        heading,
        style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            decoration: TextDecoration.underline,
            decorationThickness: 2),
      ),
    );
  }
}
