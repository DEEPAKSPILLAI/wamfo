import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/screens/information_center/buttons/blue_button.dart';
import 'package:wamfo/screens/information_center/buttons/grey_button.dart';
import 'package:wamfo/screens/information_center/buttons/white_button.dart';
import 'package:wamfo/screens/information_center/mission_area/confirmation.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area_2_vm.dart';
import 'package:wamfo/screens/information_center/mission_area/mission_area_attachment_view.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_divider.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/custom_tile_2.dart';
import 'package:wamfo/screens/information_center/teachers_sharing/teachers_sharing_vm.dart';
import '../../../components/profile/profile.dart';

class MissionAreaPage2 extends StatefulWidget {
  final serviceId;
  MissionAreaPage2({super.key, required this.serviceId});
  @override
  State<MissionAreaPage2> createState() => _MissionAreaPage2State();
}

class _MissionAreaPage2State extends State<MissionAreaPage2>
    with BasePage<MissionAreaPage2VM> {
  @override
  void didUpdateWidget(covariant MissionAreaPage2 oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  bool accepted = false;
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
                                                  const MissionArea()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Image.asset('assets/common/back.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, top: 10),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.65,
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
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
                                              "Mission Area",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24),
                                            ),
                                          ),
                                          CustomTile2(
                                            title:
                                                "${provider.missionAreaSpecifiedModel?.teacherName}",
                                            subtitle: "${provider.type}",
                                            date: DateFormat(
                                                    '''dd MMMM \n        yyyy''')
                                                .format(provider
                                                    .missionAreaSpecifiedModel!
                                                    .serviceDate!),
                                          ),
                                          CustomDivider(),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              "${provider.missionAreaSpecifiedModel?.location}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              "${provider.missionAreaSpecifiedModel?.servingFromTime}"
                                              "  -  "
                                              "${provider.missionAreaSpecifiedModel?.servingToTime}",

                                              // DateFormat.Hm().format(provider.missionAreaSpecifiedModel!.servingFromTime!),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          CustomDivider(),
                                          ListTile(
                                            title: Text(
                                              "${provider.missionAreaSpecifiedModel?.serviceDescription}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: BlueButton(
                                                buttonText:
                                                    "attachment.pdf (View)",
                                                buttonText1:
                                                    "(${DateFormat("yyyy-MM-dd").format(provider.missionAreaSpecifiedModel!.publishDate!)}  ${provider.missionAreaSpecifiedModel?.publishTime})",
                                                buttonAction: () {
                                                  // provider
                                                  //     .pdfViewerKey.currentState
                                                  //     ?.openBookmarkView();
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MissionAreaAttachment(
                                                                  doc: provider
                                                                          .missionAreaSpecifiedModel
                                                                          ?.attachment ??
                                                                      "")));
                                                }),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 70,
                                                right: 70,
                                                top: 10,
                                                bottom: 10),
                                            child: Visibility(
                                              visible: provider
                                                      .missionAreaSpecifiedModel
                                                      ?.alreadyApplied ==
                                                  false,
                                              child: WhiteButton(
                                                  whiteButtonText: 'Accept',
                                                  whiteButtonAction: () {
                                                    provider.postAcceptData(
                                                        context);
                                                    setState(() {});
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //     builder: (context) =>
                                                    //         Confirmation(),
                                                    //   ),
                                                    // );
                                                  }),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 60, right: 60),
                                            child: Visibility(
                                              visible: provider
                                                      .missionAreaSpecifiedModel
                                                      ?.alreadyApplied ==
                                                  true,
                                              child: GreyButton(
                                                  greyButtonText:
                                                      "No more acception.",
                                                  greybuttonAction: () {}),
                                            ),
                                          ),
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
            ]))));
  }

  @override
  MissionAreaPage2VM create() => MissionAreaPage2VM();
  @override
  void initialise(BuildContext context) {
    provider.id = widget.serviceId;
  }
}
