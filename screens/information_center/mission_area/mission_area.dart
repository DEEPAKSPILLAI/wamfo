import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/screens/information_center/information_center_home/information_center_home.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area_2.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area_3.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area_vm.dart';
import '../../../components/profile/profile.dart';
import '../teachers_sharing/custom_divider.dart';
import '../teachers_sharing/custom_tile.dart';

class MissionArea extends StatefulWidget {
  const MissionArea({super.key});

  @override
  State<MissionArea> createState() => _MissionAreaState();
}

class _MissionAreaState extends State<MissionArea>
    with BasePage<MissionAreaVM> {
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
            body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
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
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const InformationCenterHome()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset('assets/common/back.png'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 50, top: 10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.65,
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    decoration: BoxDecoration(
                                      color: Color(0xff2E383A),
                                      border: Border.all(
                                          color: Color(0xffD0D1D3), width: 7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Mission Area",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24),
                                          ),
                                        ),
                                        Expanded(
                                          child: MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            child: ListView.separated(
                                              separatorBuilder:
                                                  (context, index) {
                                                return const CustomDivider();
                                              },
                                              itemCount: provider
                                                  .missionAreaListModel.length,
                                              itemBuilder: (context, index) {
                                                if (provider
                                                        .missionAreaListModel[
                                                            index]
                                                        .serviceType ==
                                                    "home") {
                                                  provider.tempType =
                                                      "Home Service";
                                                } else if (provider
                                                        .missionAreaListModel[
                                                            index]
                                                        .serviceType ==
                                                    "school") {
                                                  provider.tempType =
                                                      "School Service";
                                                } else if (provider
                                                        .missionAreaListModel[
                                                            index]
                                                        .serviceType ==
                                                    "community") {
                                                  provider.tempType =
                                                      "Community Service";
                                                } else {
                                                  provider.tempType = "";
                                                }
                                                provider.tempStringDate =
                                                    provider
                                                        .missionAreaListModel[
                                                            index]
                                                        .serviceDate;

                                                provider.tempDate =
                                                    DateTime.parse(provider
                                                            .tempStringDate ??
                                                        "");
                                                return InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MissionAreaPage2(
                                                                    serviceId: provider
                                                                        .missionAreaListModel[
                                                                            index]
                                                                        .id,
                                                                  )));
                                                    },
                                                    child: CustomTile(
                                                      title:
                                                          "${provider.missionAreaListModel[index].teacherName}",
                                                      subtitle:
                                                          "${provider.tempType}",
                                                      date: DateFormat(
                                                              '''dd MMMM \n        yyyy''')
                                                          .format(provider
                                                              .tempDate!),
                                                      action: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MissionAreaPage2(
                                                                          serviceId: provider
                                                                              .missionAreaListModel[index]
                                                                              .id,
                                                                        )));
                                                      },
                                                    ));
                                              },
                                            ),
                                          ),
                                        )
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
//                                             builder: (context) =>
//                                                 MissionAreaPage2(),
//                                           ),
//                                         );
//                                       }),
//                                   CustomDivider(),
//                                   CustomTile(
//                                       title: 'Terena',
//                                       subtitle: 'School Experience',
//                                       date: '''
// 08 May
//   2022''',
//                                       action: () {}),
//                                   CustomDivider(),
//                                   CustomTile(
//                                       title: 'Dennis',
//                                       subtitle: 'Community Service',
//                                       date: '''
// 03 May
//   2022''',
//                                       action: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 MissionAreaPage3(),
//                                           ),
//                                         );
//                                       }),
//                                   CustomDivider(),
//                                   CustomTile(
//                                       title: 'Terena',
//                                       subtitle: 'School Experience',
//                                       date: '''
// 22 Apr
//   2022''',
//                                       action: () {}),
//                                   CustomDivider(),
//                                   CustomTile(
//                                       title: 'Dennis',
//                                       subtitle: 'Community Service',
//                                       date: '''
// 11 Mar
//   2022''',
//                                       action: () {}),
//                                   CustomDivider(),
//                                   CustomTile(
//                                       title: 'Terena',
//                                       subtitle: 'School Experience',
//                                       date: '''
// 22 Apr
//   2022''',
//                                       action: () {}),
                                      ],
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
          ]),
        )));
  }

  @override
  MissionAreaVM create() => MissionAreaVM();
  @override
  void initialise(BuildContext context) {}
}
