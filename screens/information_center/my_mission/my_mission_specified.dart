import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/screens/information_center/buttons/blue_button.dart';
import 'package:wamfo/screens/information_center/buttons/white_button.dart';
import 'package:wamfo/screens/information_center/mission_area/confirmation.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area_2_vm.dart';
import 'package:wamfo/screens/information_center/my_mission/heading.dart';
import 'package:wamfo/screens/information_center/my_mission/my_mission_specified_vm.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_divider.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile_2.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/teachers_sharing_vm.dart';
import '../../../components/profile/profile.dart';

class MyMissionSpecified extends StatefulWidget {
 final serviceId;
   MyMissionSpecified({super.key, required this.serviceId});

  @override
  State<MyMissionSpecified> createState() => _MyMissionSpecifiedState();
}

class _MyMissionSpecifiedState extends State<MyMissionSpecified> with BasePage <MyMissionSpecifiedVM> {
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
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
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "My Mission",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                                Heading(heading: "${provider.type1}"),
                                CustomTile2(
                                  title:"${provider.myMissionSpecifiedModel?.teacherName}",
                                  subtitle: "${provider.type}",
                                  date: 
                                   DateFormat(
                                                                          '''dd MMMM \n        yyyy''')
                                                                      .format(provider
                                                                          .myMissionSpecifiedModel!.serviceDate!),
                                ),
                                CustomDivider(),
                                Padding(
                                     padding: const EdgeInsets.only(left:20 ),
                                     child: Text(
                                      "${provider.myMissionSpecifiedModel?.location}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                  ),
                                   ),
                                
                               
                                   Padding(
                                     padding: const EdgeInsets.only(left:20 ),
                                     child: Text(
                                     "${provider.myMissionSpecifiedModel?.servingFromTime}"  "  -  " "${provider.myMissionSpecifiedModel?.servingToTime}",
                                     
                                      // DateFormat.Hm().format(provider.missionAreaSpecifiedModel!.servingFromTime!),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                  ),
                                   ),
                                
                                CustomDivider(),
                                 ListTile(
                                  title: Text(
                               "${provider.myMissionSpecifiedModel?.serviceDescription}",

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
    ));
  }
  
  @override
  MyMissionSpecifiedVM create() =>  MyMissionSpecifiedVM();
  
    
  
  
  @override
  void initialise(BuildContext context) {
     provider.id = widget.serviceId;
  }
}
