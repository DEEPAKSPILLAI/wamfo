import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/input/custom_button.dart';

import 'package:wamfo/screens/canteen/canteen_home/canteen_home.dart';
import 'package:wamfo/screens/home/home.dart';
import 'package:wamfo/screens/information_center/information_center_home/information_center_home.dart';
import 'package:wamfo/screens/island/island_vm.dart';

import 'package:wamfo/screens/redeem_center/redeem_center_home.dart';

import 'package:wamfo/screens/service_tower/service_tower_home/service_tower_home.dart';
import 'package:wamfo/screens/traning_center/traning_center.dart';

import '../auth/login/login.dart';

class IslandWidgets extends StatefulWidget {
  const IslandWidgets({Key? key}) : super(key: key);

  @override
  State<IslandWidgets> createState() => _IslandWidgetsState();
}

class _IslandWidgetsState extends State<IslandWidgets> with BasePage<IslandVM> {
  ScrollController horizontalController = ScrollController();
  ScrollController verticalController = ScrollController();

  bool showLeft = false;
  bool showRight = false;
  bool showTop = false;
  bool showBottom = false;
  @override
  void initState() {
    super.initState();
    horizontalController.addListener(() {
      setState(() {
        if (horizontalController.offset > 10) {
          showLeft = true;
        } else {
          showLeft = false;
        }
        if (horizontalController.offset >
            (horizontalController.position.maxScrollExtent - 20)) {
          showRight = false;
        } else {
          showRight = true;
        }
      });
      verticalController.addListener(() {
        setState(() {
          if (verticalController.offset > 10) {
            showBottom = true;
          } else {
            showBottom = false;
          }
          if (verticalController.offset >
              (verticalController.position.maxScrollExtent - 20)) {
            showTop = false;
          } else {
            showTop = true;
          }
        });
      });
    });
  }

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height * 0.81;
    width = MediaQuery.of(context).size.width * 1.3;
    return builder(() => Stack(
      children: [
        SingleChildScrollView(
          controller: verticalController,
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            controller: horizontalController,
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: height,
              width: width,
              child: Stack(
                children: [
                  SizedBox(
                    height: height,
                    width: width,
                    child: Image.asset(
                      'assets/home/temp.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      top: height * 0.26,
                      left: width * 0.1,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RedeemCenterHome()));
                          },
                          child: const CustomButton(
                            text: "Redeem Center",
                          ))),
                  Positioned(
                      top: height * 0.24,
                      left: width * 0.66,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const InformationCenterHome(),
                              ),
                            );
                          },
                          child: const CustomButton(
                              text: "Information \n Center"))),
                  Positioned(
                      top: height * 0.44,
                      left: 2,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TraningCenterHome(),
                              ),
                            );
                          },
                          child: const CustomButton(
                              text: "Training Center"))),
                  Positioned(
                      top: height * 0.65,
                      left: width * 0.22,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          },
                          child: const CustomButton(text: "Home"))),
                  Positioned(
                      top: height * 0.79,
                      left: width * 0.67,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ServiceTowerHome(),
                              ),
                            );
                          },
                          child: const CustomButton(
                              text: "WAMFO \n Service Tower"))),
                  Positioned(
                      top: height * 0.88,
                      left: width * 0.40,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CanteenHome(),
                              ),
                            );
                          },
                          child: const CustomButton(text: "Canteen"))),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                              ),
                          child:  Container(
                            height: 121,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Color(0xffE5444ACF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // boxShadow: const [
                                  //   BoxShadow(
                                  //     offset: Offset(-4, -4),
                                  //     blurRadius: 30.0,
                                  //     spreadRadius: 2.0
                                  //   )
                                  // ],
                                  border: Border.all(
                                      color: Color(0xff833B1C), width: 3),
                                  color: Color(0xff00249C),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Container(
                                    decoration: BoxDecoration(
                                       color: Color(0xff00249C),
                                       borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(1,1),
                                          spreadRadius: 0.1,
                                          blurRadius: 20
                                        ),
                                         BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(-1,-1),
                                          spreadRadius: 0.1,
                                          blurRadius: 1
                                        )

                                      ]
                                    ),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder:
                                            (BuildContext context) =>
                                                Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  25)),
                                                  child: Container(
                                                      height: 195,
                                                      width: 342,
                                                      decoration:
                                                          BoxDecoration(
                                                        color: Color(
                                                            0xffE5444ACF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    25),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .all(
                                                                7.0),
                                                        child:
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xff833B1C),
                                                                width:
                                                                    3),
                                                            color: Color(
                                                                0xff00249C),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    25),
                                                          ),
                                                          child: Row(
                                                            // mainAxisAlignment:
                                                            //     MainAxisAlignment
                                                            //         .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () {
                                                                  Navigator.pop(context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      40,
                                                                  child:
                                                                      Image.asset('assets/common/back.png'),
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    children: [
                                                                      Container(
                                                                        height: 40,
                                                                        child: Image.asset('assets/common/music.png'),
                                                                      ),
                                                                      Text(
                                                                        "Music",
                                                                        style: TextStyle(color: Colors.white, fontSize: 24),
                                                                      ),
                                                                      // FlutterSwitch(
                                                                      //   width: 58,
                                                                      //   height: 29,
                                                                      //   valueFontSize: 11,
                                                                      //   toggleSize: 37.0,
                                                                      //   value: status,
                                                                      //   borderRadius: 30.0,
                                                                      //   padding: 8.0,
                                                                      //   showOnOff: true,
                                                                      //   activeTextColor: Colors.white,
                                                                      //   inactiveTextColor: Colors.white,
                                                                      //   activeText: "ON",
                                                                      //   inactiveText: "OFF",
                                                                      //   activeToggleColor: Color(0xff5AEE00),
                                                                      //   inactiveToggleColor: Color(0xff727272),
                                                                      //   onToggle: (val) {
                                                                      //     setState(() {
                                                                      //       status = val;
                                                                      //     });
                                                                      //   },
                                                                      // ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height: 40,
                                                                        child: Image.asset('assets/common/volume.png'),
                                                                      ),
                                                                      Text(
                                                                        "Sounds",
                                                                        style: TextStyle(color: Colors.white, fontSize: 24),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height: 40,
                                                                        child: Image.asset('assets/common/carbon_help.png'),
                                                                      ),
                                                                      Text(
                                                                        "Genie Help",
                                                                        style: TextStyle(color: Colors.white, fontSize: 24),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                ));
                                  },
                                  child: Container(
                                      child: Image.asset(
                                          'assets/common/setting.png')),
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.prefs.removeAll();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()),
                                        (route) => false);
                                  },
                                  child: Container(
                                      child: Image.asset(
                                          'assets/common/logout.png')),
                                )
                              ],
                            ),
                            //margin: EdgeInsets.all(8),
                          ),
                        ))))));
              },
              child: Image.asset('assets/common/gear.png'),
            )),
        Positioned(
          left: 10,
          top: (MediaQuery.of(context).size.height - 200) / 2,
          child: Visibility(
            visible: showLeft,
            child: InkWell(
              onTap: () {
                horizontalController.animateTo(
                    horizontalController.offset -
                        (horizontalController.position.maxScrollExtent /
                            2),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
              child: Image.asset('assets/common/left.png'),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: (MediaQuery.of(context).size.width - 50) / 2,
          child: Visibility(
            visible: showTop,
            child: InkWell(
              onTap: () {
                verticalController.animateTo(
                    verticalController.offset +
                        (verticalController.position.maxScrollExtent / 2),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
              child: Image.asset('assets/common/top.png'),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: (MediaQuery.of(context).size.width - 50) / 2,
          child: Visibility(
            visible: showBottom,
            child: InkWell(
              onTap: () {
                verticalController.animateTo(
                    verticalController.offset -
                        (verticalController.position.maxScrollExtent / 2),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
              child: Image.asset('assets/common/down.png'),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: (MediaQuery.of(context).size.height - 200) / 2,
          child: Visibility(
            visible: showRight,
            child: InkWell(
       onTap: () {
                horizontalController.animateTo(
                    horizontalController.offset +
                        (horizontalController.position.maxScrollExtent /
                            2),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
              child: Image.asset('assets/common/right.png'),
            ),
          ),
        ),
      ],
    ));
  }

  @override
  IslandVM create() => IslandVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
