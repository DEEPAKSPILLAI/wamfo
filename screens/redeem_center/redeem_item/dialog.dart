import 'package:flutter/material.dart';
import 'package:wamfo/screens/redeem_center/redeem_item/dialog1.dart';
import 'package:wamfo/screens/redeem_center/redeem_item/redeem_item.dart';

class Dialogue extends StatelessWidget {
  const Dialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFFFEDE)),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Do you want to buy ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xff8E4940),
                        ),
                      ),
                      TextSpan(
                        text: '1 ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xffFFC46D),
                        ),
                      ),
                      TextSpan(
                        text: 'Rubies with',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xff8E4940),
                        ),
                      ),
                      TextSpan(
                        text: ' 100',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xffFFC46D),
                        ),
                      ),
                      // TextSpan(
                      //     text: ,
                      //     style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
                const Text(
                  'WAMFO coins? ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff8E4940),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 40,
                        width: 23,
                        child: Image.asset('assets/common/redeem1.png')),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'x',
                      style: TextStyle(color: Color(0xff8E4940)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '1',
                      style: TextStyle(color: Color(0xff8E4940)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => leadDialog1);
                      },
                      child: Container(
                          height: 25,
                          width: 92,
                          decoration: BoxDecoration(
                              color: const Color(0xff8E4940),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              'Yes!',
                              style: TextStyle(color: Color(0xffFFFFFF)),
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RedeemItem()));
                      },
                      child: Container(
                          height: 25,
                          width: 92,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff8E4940), width: 1),
                              color: const Color(0xffFFFEDE),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Text(
                            'No,thanks',
                            style: TextStyle(color: Color(0xff8E4940)),
                          ))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
class Dialogue1 extends StatelessWidget {
  const Dialogue1({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //insetPadding: const EdgeInsets.all(10),
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffFFFEDE)),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Do you want to buy ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xff8E4940),
                        ),
                      ),
                      TextSpan(
                        text: '\$10 ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xffFFC46D),
                        ),
                      ),
                      TextSpan(
                        text: 'Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xff8E4940),
                        ),
                      ),
                    ],
                  ),
                ),
                // const Text('WAMFO coins?',
                // textAlign: TextAlign.center,
                // style: TextStyle(
                //             fontSize: 16,
                //              color: Color(0xff8E4940),
                //           ),),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Play Coupon with ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xff8E4940),
                        ),
                      ),
                      TextSpan(
                        text: '999 ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xffFFC46D),
                        ),
                      ),
                      TextSpan(
                        text: 'Rubies?',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DIOGENES',
                          color: Color(0xff8E4940),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 40,
                        width: 23,
                        child: Image.asset('assets/common/googleplay.png')),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'x',
                      style: TextStyle(color: Color(0xff8E4940)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '\$1',
                      style: TextStyle(color: Color(0xff8E4940)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => leadDialog1);
                      },
                      child: Container(
                          height: 25,
                          width: 92,
                          decoration: BoxDecoration(
                              color: const Color(0xff8E4940),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              'Yes!',
                              style: TextStyle(color: Color(0xffFFFFFF)),
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RedeemItem()));
                      },
                      child: Container(
                          height: 25,
                          width: 92,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff8E4940), width: 1),
                              color: const Color(0xffFFFEDE),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Text(
                            'No,thanks',
                            style: TextStyle(color: Color(0xff8E4940)),
                          ))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
