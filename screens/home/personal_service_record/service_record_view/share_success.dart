import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:wamfo/components/profile/profile.dart';

import 'package:wamfo/screens/home/personal_information/buttons/button1.dart';

import 'package:wamfo/screens/home/personal_service_record/service_record_view/service_record_view.dart';

class ShareSuccess extends StatelessWidget {
  const ShareSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Profile(),
      Container(
          height: MediaQuery.of(context).size.height - 185,
          width: MediaQuery.of(context).size.width * 3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/common/home.jpg'),
            ),
          ),
          child: Stack(children: [
            ClipRRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset('assets/common/back.png'),
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 110, left: 82, right: 82),
                                    child: Container(
                                      height: 140,
                                      width: 230,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              height: 41,
                                              width: 43,
                                              child: Image.asset(
                                                  'assets/common/check.png')),
                                          const Text(
                                            '''SHARE \nSUCCESS''',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 45,
                                    width: 95,
                                    child: Button1(
                                        buttonText: 'Finished',
                                        buttonAction: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ServiceRecordView()));
                                        }),
                                  )
                                ],
                              ),
                            )
                          ]),
                    )))
          ]))
    ]));
  }
}
