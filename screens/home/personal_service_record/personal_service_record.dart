import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/home/home.dart';

import 'package:wamfo/screens/home/personal_information/buttons/button1.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_edit/service_record_edit.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_view/service_record_view.dart';

// void main() {
//   runApp(const Personalservicerecord());
// }

class PersonalServiceRecord extends StatelessWidget {
  const PersonalServiceRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/common/home.jpg'),
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Profile(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/common/back.png'),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        // margin: const EdgeInsets.fromLTRB(30, 70, 30, 230),
                        // height: double.infinity,
                        // width: double.infinity,
                        height: 210,
                        width: 310,
                        decoration: BoxDecoration(
                            color: const Color(0xffEEE3D0),
                            border: Border.all(
                                color: const Color(0xff866035), width: 6),
                            borderRadius: BorderRadius.circular(10.0)),
                        //child:
                        //  Padding(
                        //   padding:
                        //           const EdgeInsets.only(left: 40,right: 40,top: 65),
                        // child:Align(
                        //   alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text.rich(
                                      TextSpan(
                                        text: '1. ',
                                        style: TextStyle(fontSize: 17),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Re-view',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                              )),
                                          TextSpan(
                                            text: ' your service record',
                                            style: TextStyle(fontSize: 17),
                                          )

                                          // can add more TextSpans here...
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '2. ',
                                        style: TextStyle(fontSize: 17),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Input',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                              )),
                                          TextSpan(
                                            text: ' your service record',
                                            style: TextStyle(fontSize: 17),
                                          )

                                          // can add more TextSpans here...
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 91,
                                      child: Button1(
                                        buttonText: '1',
                                        buttonAction: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ServiceRecordView()));
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: 48,
                                      width: 91,
                                      child: Button1(
                                        buttonText: '2',
                                        buttonAction: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ServiceRecordEdit()));
                                        },
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ),
                    // ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
