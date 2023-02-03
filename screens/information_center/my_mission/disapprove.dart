import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wamfo/screens/information_center/buttons/blue_button.dart';
import 'package:wamfo/screens/information_center/buttons/white_button.dart';
import 'package:wamfo/screens/information_center/mission_area/confirmation.dart';
import 'package:wamfo/screens/information_center/my_mission/heading.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_divider.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile_2.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/teachers_sharing_vm.dart';
import '../../../components/profile/profile.dart';

class Disapprove extends StatelessWidget {
  const Disapprove({super.key});

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
                            'assets/common/information_center_blur.jpg'),
                      ),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
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
                              child:
                                  Image.asset('assets/common/blue_button.png'),
                            )),
                        Positioned(
                          top: 32,
                          left: 30,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/common/back_arrow.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45, top: 70),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            width: MediaQuery.of(context).size.width * 0.75,
                            decoration: BoxDecoration(
                              color: Color(0xff2E383A),
                              border: Border.all(
                                  color: Color(0xffD0D1D3), width: 7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListView(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "My Mission",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                                Heading(heading: 'Disapproved'),
                                CustomTile2(
                                  title: 'Dennis',
                                  subtitle: 'Community Service',
                                  date: '''
11 May
  2022''',
                                ),
                                CustomDivider(),
                                ListTile(
                                  subtitle: Text(
                                    "Location Location Location \n 11:30 - 12:30",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                CustomDivider(),
                                ListTile(
                                  title: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Congue lorem duis sollicitudin quis vitae nunc. Odio quis ut bibendum egestas tristique porttitor sed. Tempus senectus volutpat volutpat, cras ultricies. Scelerisque integer cursus auctor integer tempus a, vestibulum at aliquam. Vitae aenean",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
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
    );
  }
}
