import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/screens/information_center/my_mission/my_mission_specified.dart';
import 'package:wamfo/screens/information_center/my_mission/heading.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_divider.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile.dart';
import '../../../components/profile/profile.dart';
import 'package:wamfo/screens/information_center/my_mission/my_mission_vm.dart';

class MyMission extends StatefulWidget {
  const MyMission({super.key});

  @override
  State<MyMission> createState() => _MyMissionState();
}

class _MyMissionState extends State<MyMission> with BasePage<MyMissionVM> {
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
//                               child: ListView(
//                                 children: [
//                                   const Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       "My Mission",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 24),
//                                     ),
//                                   ),
//                                   Heading(heading: 'Approve'),
//                                   CustomTile(
//                                       title: 'Dennis',
//                                       subtitle: 'Community Service',
//                                       date: '''
// 11 May
//   2022''',
//                                       action: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => Approve(),
//                                           ),
//                                         );
//                                       }),
//                                   CustomDivider(),
//                                   Heading(heading: 'Waiting for approval'),
//                                   CustomTile(
//                                       title: 'Dennis',
//                                       subtitle: 'Community Service',
//                                       date: '''
// 11 May
//   2022''',
//                                       action: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => Waiting(),
//                                           ),
//                                         );
//                                       }),
//                                   CustomDivider(),
//                                   Heading(heading: 'Disapprove'),
//                                   CustomTile(
//                                       title: 'Dennis',
//                                       subtitle: 'Community Service',
//                                       date: '''
// 11 May
//   2022''',
//                                       action: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => Disapprove(),
//                                           ),
//                                         );
//                                       }),
//                                   CustomDivider(),
//                                 ],
//                               ),

                              //  child: Expanded(
                              //    child: ListView.builder(
                              //     itemCount: 4 ,
                              //     itemBuilder:(context, index) {
                              //       return  Column(
                              //         crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: [
                              //         Heading(heading: 'Approve'),
                              //       CustomTile(
                              //           title: 'Dennis',
                              //           subtitle: 'Community Service',
                              //           date: '''
                              //  11 May
                              //    2022''',
                              //           action: () {
                              //             Navigator.push(
                              //               context,
                              //               MaterialPageRoute(
                              //                 builder: (context) => Approve(),
                              //               ),
                              //             );
                              //           }),
                              //       CustomDivider(),
                              //         ],
                              //       );
                              //     },),
                              //  ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "My Mission",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                  ),
                                  Expanded(
                                    child: MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return const CustomDivider();
                                        },
                                        itemCount:
                                            provider.myMissionListModel.length,
                                        itemBuilder: (context, index) {
                                          if (provider.myMissionListModel[index]
                                                  .status ==
                                              "approved") {
                                            provider.statusType = "Approve";
                                          } else if (provider
                                                  .myMissionListModel[index]
                                                  .status ==
                                              "waiting") {
                                            provider.statusType =
                                                "Waiting for approval";
                                          } else if (provider
                                                  .myMissionListModel[index]
                                                  .status ==
                                              "disapproved") {
                                            provider.statusType = "Disapprove";
                                          } else {
                                            provider.statusType = "";
                                          }

                                          if (provider.myMissionListModel[index]
                                                  .serviceType ==
                                              "home") {
                                            provider.tempType = "Home Service";
                                          } else if (provider
                                                  .myMissionListModel[index]
                                                  .serviceType ==
                                              "school") {
                                            provider.tempType =
                                                "School Service";
                                          } else if (provider
                                                  .myMissionListModel[index]
                                                  .serviceType ==
                                              "community") {
                                            provider.tempType =
                                                "Community Service";
                                          } else {
                                            provider.tempType = "";
                                          }
                                          provider.tempStringDate = provider
                                              .myMissionListModel[index]
                                              .serviceDate;

                                          provider.tempDate = DateTime.parse(
                                              provider.tempStringDate ?? "");

                                          return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyMissionSpecified(
                                                              serviceId: provider
                                                                  .myMissionListModel[
                                                                      index]
                                                                  .id,
                                                            )));
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Heading(
                                                      heading:
                                                          "${provider.statusType}"),
                                                  CustomTile(
                                                    title:
                                                        "${provider.myMissionListModel[index].teacherName}",
                                                    subtitle:
                                                        "${provider.tempType}",
                                                    date: DateFormat(
                                                            '''dd MMMM \n        yyyy''')
                                                        .format(
                                                            provider.tempDate!),
                                                    action: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MyMissionSpecified(
                                                                    serviceId: provider
                                                                        .myMissionListModel[
                                                                            index]
                                                                        .id,
                                                                  )));
                                                    },
                                                  ),
                                                ],
                                              ));
                                        },
                                      ),
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
  MyMissionVM create() => MyMissionVM();

  @override
  void initialise(BuildContext context) {}
}
