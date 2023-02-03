import 'package:flutter/material.dart';


Dialog leadDialog1 =Dialog(
  
   shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)
    ),
   child: Container(
    height: 172,
    width: 270,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffFFC46D),
              Color(0xffFFD067),
              Color(0xffCD553F),
            ])),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        // height: 150,
        // width: 240,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: const Color(0xffFFFEDE)),
        child: const Center(
          child: Text('Thank You!',
          style: TextStyle(
            color: Color(0xff8E4940),
            fontSize: 24,
          ),),
        )
      ),
    ),
  ),
);