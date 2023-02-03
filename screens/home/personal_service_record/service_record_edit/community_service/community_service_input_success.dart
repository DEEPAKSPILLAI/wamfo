import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/home/personal_information/buttons/button1.dart';
import 'package:wamfo/screens/home/personal_service_record/personal_service_record.dart';

class CommunityServiceSuccess extends StatelessWidget {
  const CommunityServiceSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Profile(),
      Container(
          height: MediaQuery.of(context).size.height - 185,
          width: MediaQuery.of(context).size.width,
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
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 71, right: 71, top: 158),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // const SizedBox(
                              //   height: 50,
                              // ),
                              Container(
                                height: 140,
                                width: 260,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15)),
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
                                      ''' SUBMITTED \n    SUCCESS''',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: const Text(
                                  '''    Please wait for   \nteacher's verification''',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 10,
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
                                                  const PersonalServiceRecord()));
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
