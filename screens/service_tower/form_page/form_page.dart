import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/service_tower/buttons/buttonImage.dart';
import 'package:wamfo/screens/service_tower/community_service/community_service.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Form 1',
                                      style: TextStyle(
                                          color: Color(0xff008F06),
                                          fontSize: 24),
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
                                  ButtonImage(
                                      buttonText: 'Community Service',
                                      buttonAction: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CommunityService()),
                                        );
                                      }),
                                  ButtonImage(
                                      buttonText: 'Home Service',
                                      buttonAction: () {}),
                                  ButtonImage(
                                      buttonText: 'School Service',
                                      buttonAction: () {}),
                                ],
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
      ),
    );
  }
}
