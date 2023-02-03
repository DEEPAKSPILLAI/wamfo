import 'package:flutter/material.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/input/custom_button_1.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/auth/login/login.dart';
import 'package:wamfo/screens/island/island.dart';
import 'package:wamfo/screens/redeem_center/mysterious_box/mysterious_box.dart';
import 'package:wamfo/screens/redeem_center/redeem_center_home_vm.dart';
import 'package:wamfo/screens/redeem_center/redeem_item/redeem_item.dart';


class RedeemCenterHome extends StatefulWidget {
  const RedeemCenterHome({super.key});

  @override
  State<RedeemCenterHome> createState() => _RedeemCenterHomeState();
}

class _RedeemCenterHomeState extends State<RedeemCenterHome> 
     with BasePage<RedeemCenterHomeVM>{
  ScrollController controller = ScrollController();

  bool showLeft = false;
  bool showRight = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        if (controller.offset > 10) {
          showLeft = true;
        } else {
          showLeft = false;
        }
        if (controller.offset > (controller.position.maxScrollExtent - 20)) {
          showRight = false;
        } else {
          showRight = true;
        }
      });
    });
  }

  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height - 185;
    width = MediaQuery.of(context).size.width;
    return builder(
      () => Scaffold(
        body: Column(
          children: [
            const Profile(),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 3,
                      height: MediaQuery.of(context).size.height - 185,
                      // color: Colors.red,
                      child: SizedBox(
                        height: height,
                        width: width,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: height,
                              child: Image.asset(
                                'assets/home/redeemhome.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: height * 0.65,
                              left: width * 0.42,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                     MaterialPageRoute(
                                      builder: (context) => const MysteriousBox()));
                                },
                                child: const CustomButton1(
                                    text: "Mysterious box"),
                              ),
                            ),
                            Positioned(
                              top: height * 0.74,
                              left: width * 1.42,
                              child: InkWell(
                                onTap: () {
                                Navigator.push(
                                  context,
                                   MaterialPageRoute(
                                    builder: (context)=> const RedeemItem()));
                                  
                                },
                                child: const CustomButton1(
                                    text: "Redeem item"),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      // child: Image.asset(
                      //   'assets/home/home.png',
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: (MediaQuery.of(context).size.height - 200) / 2,
                    child: Visibility(
                      visible: showLeft,
                      child: InkWell(
                        onTap: () {
                          controller.animateTo(
                              controller.offset -
                                  (controller.position.maxScrollExtent / 1),
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Image.asset('assets/common/left.png'),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                                 MaterialPageRoute(
                                  builder: (context)=> const Island()));
                        },
                        child: Image.asset('assets/common/backToIsland.png'),
                      )),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            height: 121,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Color(0xffE5444ACF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child:  Container(
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
                            ),
                          ),
                        ))));
              },
              child: Image.asset('assets/common/gear.png'),
            )),
                  // CustomButton1(text: "Rest to recover vitality"),
                  Positioned(
                    right: 10,
                    top: (MediaQuery.of(context).size.height - 200) / 2,
                    child: Visibility(
                      visible: showRight,
                      child: InkWell(
                        onTap: () {
                          controller.animateTo(
                              controller.offset +
                                  (controller.position.maxScrollExtent / 2),
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Image.asset('assets/common/right.png'),
                      ),
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

   @override
  RedeemCenterHomeVM create() => RedeemCenterHomeVM();

  @override
  void initialise(BuildContext context) {}
}