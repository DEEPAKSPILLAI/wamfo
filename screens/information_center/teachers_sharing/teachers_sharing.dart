import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_divider.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/teachers_sharing_2.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/teachers_sharing_vm.dart';
import '../../../components/profile/profile.dart';

class TeacherSharing extends StatefulWidget {
  const TeacherSharing({super.key});

  @override
  State<TeacherSharing> createState() => _TeacherSharingState();
}

class _TeacherSharingState extends State<TeacherSharing>
    with BasePage<TeacherSharingVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
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
                              'assets/common/information_center_blur.jpg'),
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                              top: 20,
                              left: 20,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                    'assets/common/blue_button.png'),
                              )),
                          Positioned(
                            top: 32,
                            left: 30,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  Image.asset('assets/common/back_arrow.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 70),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.65,
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                color: Color(0xff2E383A),
                                border: Border.all(
                                    color: Color(0xffD0D1D3), width: 7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Teacher's Sharing",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        CustomTile(
                                            title: 'Dennis',
                                            subtitle:
                                                'Share something interesting with everyone',
                                            date: '''
11 May
  2022''',
                                            action: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeacherSharingPage2(),
                                                ),
                                              );
                                            }),
                                        CustomDivider(),
                                        CustomTile(
                                            title: 'Terena',
                                            subtitle: 'Great Exp',
                                            date: '''
08 May
   2022''',
                                            action: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeacherSharingPage2(),
                                                ),
                                              );
                                            }),
                                        CustomDivider(),
                                        CustomTile(
                                            title: 'Dennis',
                                            subtitle:
                                                'Share something interesting with everyone',
                                            date: '''
11 May
  2022''',
                                            action: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeacherSharingPage2(),
                                                ),
                                              );
                                            }),
                                        CustomDivider(),
                                        CustomTile(
                                            title: 'Terena',
                                            subtitle:
                                                'Share something interesting with everyone',
                                            date: '''
 08 May
   2022''',
                                            action: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeacherSharingPage2(),
                                                ),
                                              );
                                            }),
                                        CustomDivider(),
                                        CustomTile(
                                            title: 'Dennis',
                                            subtitle:
                                                'Share something interesting with everyone',
                                            date: '''
11 May
 2022''',
                                            action: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeacherSharingPage2(),
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  TeacherSharingVM create() => TeacherSharingVM();

  @override
  void initialise(BuildContext context) {}
}
