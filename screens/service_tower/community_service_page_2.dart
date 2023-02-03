import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/service_tower/community_service/community_service_vm.dart';

class CommunityService2 extends StatelessWidget {
  const CommunityService2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Profile(),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.height - 185,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(
                          'assets/common/service_record_bg.jpg'),
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
                          
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/common/back.png'),
                            ),
                          ),
                          Expanded(
                      child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                margin: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                                height: double.infinity,
                                width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffF6DFB5),
                                border: Border.all(
                                    color: Color(0xff8A541E), width: 8),
                                borderRadius: BorderRadius.circular(10)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Form 1 - Community Service',
                                      style: TextStyle(
                                          color: Color(0xff008F06), fontSize: 24),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Divider(
                                    height: 20,
                                    indent: 60,
                                    endIndent: 60,
                                    color: Color(0xff008F06).withOpacity(.5),
                                    thickness: 2,
                                  ),
                                  Container(
                                    //color: Colors.white,
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Program Nature:',
                                          style: TextStyle(
                                            color: Color(0xff996B51),
                                            fontSize: 17,
                                          ),
                                        ),
                                        const Text(
                                          'Disaster Preparedness X Nature Education - Secondary School Programme on Disaster Resilience',
                                          style: TextStyle(
                                              color: Color(0xff64361C),
                                              fontSize: 17),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'Date:',
                                          style: TextStyle(
                                            color: Color(0xff996B51),
                                            fontSize: 17,
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              '22 May, 2022',
                                              style: TextStyle(
                                                  color: Color(0xff64361C),
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        const Text(
                                          'Reflection:',
                                          style: TextStyle(
                                            color: Color(0xff996B51),
                                            fontSize: 17,
                                          ),
                                        ),
                                        const Text(
                                          "Community Service are organized activities aiming at improving the conditions of the disadvantaged members of our society as well as enriching one's personal life.",
                                          style: TextStyle(
                                              color: Color(0xff64361C),
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        ]
                      ),
                          )))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  CommunityServiceVM create() => CommunityServiceVM();
}
