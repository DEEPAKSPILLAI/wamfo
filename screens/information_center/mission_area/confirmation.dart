import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wamfo/screens/information_center/buttons/blue_button.dart';
import 'package:wamfo/screens/information_center/buttons/white_button.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_divider.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile_2.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/teachers_sharing_vm.dart';
import '../../../components/profile/profile.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

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
                           child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 50),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            width: MediaQuery.of(context).size.width * 0.75,
                            decoration: BoxDecoration(
                              color: Color(0xff2E383A),
                              border: Border.all(
                                  color: Color(0xffD0D1D3), width: 7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 32, right: 32, top: 150, bottom: 150),
                                child: ListView(
                                  children: [
                                    //   CustomTile2(
                                    //       title: "Application Received",
                                    //       subtitle:
                                    //           "Remind:if teacher invite you to take up the mission, please show upon time"),
                                    Center(
                                      child: Text(
                                        "Application Received",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Remind: if teacher invite you to take up the mission, please show upon time",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50,
                                          right: 50,
                                          top: 10,
                                          bottom: 10),
                                      child: WhiteButton(
                                          whiteButtonText: 'OK!',
                                          whiteButtonAction: () {
                                            Navigator.push(context,
                                             MaterialPageRoute(builder: (context) => const MissionArea()));
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                          ))
                ],
              ),
            ),
          ],
        ),
      ),
          ]
        ))
    );
  }
}
