import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/redeem_center/redeem_center_home.dart';
import 'package:wamfo/screens/redeem_center/redeem_item/dialog.dart';
import 'package:wamfo/screens/redeem_center/redeem_item/redeem_item_vm.dart';

class RedeemItem extends StatefulWidget {
  const RedeemItem({super.key});

  @override
  State<RedeemItem> createState() => _RedeemItemState();
}

class _RedeemItemState extends State<RedeemItem>
    with BasePage<RedeemItemVM>, SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return builder(() => DefaultTabController(
          length: 2,
          child: Scaffold(
              body: Column(children: [
            const Profile(),
            Container(
                height: MediaQuery.of(context).size.height - 185,
                width: MediaQuery.of(context).size.width * 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/common/redeemitem.png'),
                  ),
                ),
                child: Stack(children: [
                  ClipRRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
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
                                                    const RedeemCenterHome()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'assets/common/back.png'),
                                      ),
                                    ),
                                    // Container(
                                    //   color: Colors.red,
                                    //   height: 80,
                                    // ),
                                    Expanded(
                                      child: Container(
                                        // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                        margin: const EdgeInsets.fromLTRB(
                                            40, 0, 40, 20),
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                              Color(0xffF9DE9B),
                                              Color(0xffA34F33),
                                              Color(0xffF49E4D),
                                            ])),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: Container(
                                            // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                            // margin: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                                            height: double.infinity,
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              color: Color(0xffFFEFA2),
                                            ),

                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  'Redeem',
                                                  style: TextStyle(
                                                      shadows: <Shadow>[
                                                        Shadow(
                                                            offset:
                                                                Offset(2, 1),
                                                            color: Color(
                                                                0xff92502A80))
                                                      ],
                                                      color: Color(0xffFFD440),
                                                      fontSize: 32,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 0,
                                                ),
                                                Container(
                                                  child: TabBar(
                                                      indicatorSize:
                                                          TabBarIndicatorSize
                                                              .label,
                                                      indicatorPadding:
                                                          EdgeInsets.zero,
                                                      indicatorColor:
                                                          const Color(
                                                              0xff8E4940),
                                                      indicatorWeight: 1.2,
                                                      labelColor: const Color(
                                                          0xffE59053),
                                                      controller: _controller,
                                                      tabs: const [
                                                        Text(
                                                          'Regular',
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        Text('Special',
                                                            style: TextStyle(
                                                                fontSize: 20)),
                                                      ]),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                // TabBarView(
                                                //   controller: _controller,
                                                //   children: [
                                                //     Padding(
                                                //     padding: EdgeInsets.all(50.0),
                                                //       child: Container(
                                                //          height:MediaQuery.of(context).size.height,
                                                //          width: MediaQuery.of(context).size.width,
                                                //          padding: const EdgeInsets.fromLTRB(70.0, 200.0, 70.0, 80.0),
                                                //          decoration: BoxDecoration(
                                                //                               color: const Color(0xffEEE3D0),
                                                //                               border: Border.all(color: const Color(0xffC54547),width: 2),
                                                //                               borderRadius: BorderRadius.circular(10.0)
                                                //                               ),
                                                //           child: ListView.separated(
                                                //             itemBuilder:  (context, index) {
                                                //               return ListTile(
                                                //                 title: Text('data $index'),
                                                //                 subtitle: Text('data $index'),
                                                //               );
                                                //             },
                                                //             itemCount: 7,
                                                //             separatorBuilder: (context, index) {
                                                //               return Divider();
                                                //             }
                                                //           ),
                                                //       ),
                                                //      )
                                                //  Container(
                                                //       padding: EdgeInsets.fromLTRB(90, 30, 50, 350,),
                                                //       // height: 10,
                                                //       // width: 10,
                                                //       color: Colors.red,          //   ])

                                                //  const TabBaritem()
                                                Expanded(
                                                  child: TabBarView(
                                                      controller: _controller,
                                                      children: [
                                                        GridView.builder(
                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisSpacing:
                                                                    0,
                                                                mainAxisSpacing:
                                                                    20,
                                                                crossAxisCount:
                                                                    2),
                                                            itemCount: provider
                                                                .redeemModel
                                                                ?.regular
                                                                ?.length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            gradient: const LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                              Color(0xffF9DE9B),
                                                                              Color(0xffA34F33),
                                                                              Color(0xffF49E4D),
                                                                            ])),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              3.0),
                                                                      child:
                                                                          Container(
                                                                        // width:
                                                                        //     40,
                                                                        // height:
                                                                        //     100,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top: 10,
                                                                              left: 12,
                                                                              right: 12),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            // scrollDirection: Axis.vertical,
                                                                            child:
                                                                                FittedBox(
                                                                              child: Column(
                                                                                children: [
                                                                                  Container(
                                                                                    height: 45,
                                                                                    width: 80,
                                                                                    decoration: BoxDecoration(border: Border.all(color: const Color(0xffF1BD79), width: 2), borderRadius: BorderRadius.circular(4)),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        "${provider.redeemModel?.regular?[index].itemName}",
                                                                                        style: const TextStyle(
                                                                                          color: Color(0xff8E4940),
                                                                                          fontSize: 14,
                                                                                          // fontWeight: FontWeight.bold
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      const SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Container(height: 40, width: 23, child: Image.network("${provider.redeemModel?.regular?[index].icon}")),
                                                                                      const SizedBox(
                                                                                        width: 15,
                                                                                      ),
                                                                                      const Text(
                                                                                        'x',
                                                                                        style: TextStyle(color: Color(0xff8E4940)),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text(
                                                                                        "${provider.redeemModel?.regular?[index].rubies}",
                                                                                        style: const TextStyle(color: Color(0xff8E4940)),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      showDialog(
                                                                                          context: context,
                                                                                          builder: (BuildContext context) => Dialog(
                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                                                                child: Container(
                                                                                                  height: 172,
                                                                                                  width: 270,
                                                                                                  decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                      gradient: const LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                                                        Color(0xffFFC46D),
                                                                                                        Color(0xffFFD067),
                                                                                                        Color(0xffCD553F),
                                                                                                      ])),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.all(5.0),
                                                                                                    child: Container(
                                                                                                      // height: 150,
                                                                                                      // width: 240,
                                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffFFFEDE)),
                                                                                                      child: Column(
                                                                                                        children: [
                                                                                                          const SizedBox(
                                                                                                            height: 10,
                                                                                                          ),
                                                                                                          RichText(
                                                                                                            text: TextSpan(
                                                                                                              style: const TextStyle(color: Colors.black),
                                                                                                              children: <TextSpan>[
                                                                                                                const TextSpan(
                                                                                                                  text: 'Do you want to buy ',
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: 16,
                                                                                                                    fontFamily: 'DIOGENES',
                                                                                                                    color: Color(0xff8E4940),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: "${provider.redeemModel?.regular?[index].rubies}",
                                                                                                                  style: const TextStyle(
                                                                                                                    fontSize: 16,
                                                                                                                    fontFamily: 'DIOGENES',
                                                                                                                    color: Color(0xffFFC46D),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: ' Rubies with ',
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: 16,
                                                                                                                    fontFamily: 'DIOGENES',
                                                                                                                    color: Color(0xff8E4940),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: "${provider.redeemModel?.regular?[index].wamfoCoins}",
                                                                                                                  style: const TextStyle(
                                                                                                                    fontSize: 16,
                                                                                                                    fontFamily: 'DIOGENES',
                                                                                                                    color: Color(0xffFFC46D),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          const Text(
                                                                                                            'WAMFO coins? ',
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: TextStyle(
                                                                                                              fontSize: 16,
                                                                                                              color: Color(0xff8E4940),
                                                                                                            ),
                                                                                                          ),
                                                                                                          const SizedBox(
                                                                                                            height: 10,
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              const SizedBox(
                                                                                                                width: 5,
                                                                                                              ),
                                                                                                              Container(height: 40, width: 23, child: Image.network("${provider.redeemModel?.regular?[index].icon}")),
                                                                                                              const SizedBox(
                                                                                                                width: 15,
                                                                                                              ),
                                                                                                              const Text(
                                                                                                                'x',
                                                                                                                style: TextStyle(color: Color(0xff8E4940)),
                                                                                                              ),
                                                                                                              const SizedBox(
                                                                                                                width: 5,
                                                                                                              ),
                                                                                                              Text(
                                                                                                                "${provider.redeemModel?.regular?[index].rubies}",
                                                                                                                style: const TextStyle(color: Color(0xff8E4940)),
                                                                                                              )
                                                                                                            ],
                                                                                                          ),
                                                                                                          const SizedBox(
                                                                                                            height: 10,
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                            children: [
                                                                                                              InkWell(
                                                                                                                onTap: () {
                                                                                                                  showDialog(
                                                                                                                      context: context,
                                                                                                                      builder: (BuildContext context) => Dialog(
                                                                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                                                                                            child: Container(
                                                                                                                              height: 172,
                                                                                                                              width: 270,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                                                  gradient: const LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                                                                                    Color(0xffFFC46D),
                                                                                                                                    Color(0xffFFD067),
                                                                                                                                    Color(0xffCD553F),
                                                                                                                                  ])),
                                                                                                                              child: Padding(
                                                                                                                                padding: const EdgeInsets.all(5.0),
                                                                                                                                child: Container(
                                                                                                                                    // height: 150,
                                                                                                                                    // width: 240,
                                                                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffFFFEDE)),
                                                                                                                                    child: const Center(
                                                                                                                                      child: Text(
                                                                                                                                        'Thank You!',
                                                                                                                                        style: TextStyle(
                                                                                                                                          color: Color(0xff8E4940),
                                                                                                                                          fontSize: 24,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    )),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ));
                                                                                                                  provider.regularApply(context, provider.redeemModel?.regular?[index].id ?? 0);
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                    height: 25,
                                                                                                                    width: 92,
                                                                                                                    decoration: BoxDecoration(color: const Color(0xff8E4940), borderRadius: BorderRadius.circular(8)),
                                                                                                                    child: const Center(
                                                                                                                      child: Text(
                                                                                                                        'Yes!',
                                                                                                                        style: TextStyle(color: Color(0xffFFFFFF)),
                                                                                                                      ),
                                                                                                                    )),
                                                                                                              ),
                                                                                                              InkWell(
                                                                                                                onTap: () {
                                                                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RedeemItem()));
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                    height: 25,
                                                                                                                    width: 92,
                                                                                                                    decoration: BoxDecoration(border: Border.all(color: Color(0xff8E4940), width: 1), color: const Color(0xffFFFEDE), borderRadius: BorderRadius.circular(8)),
                                                                                                                    child: const Center(
                                                                                                                        child: Text(
                                                                                                                      'No,thanks',
                                                                                                                      style: TextStyle(color: Color(0xff8E4940)),
                                                                                                                    ))),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ));
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 25,
                                                                                      width: 92,
                                                                                      decoration: BoxDecoration(color: const Color(0xff8E4940), borderRadius: BorderRadius.circular(8)),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Container(height: 20, width: 19, child: Image.asset('assets/common/coin.png')),
                                                                                          const SizedBox(
                                                                                            width: 7,
                                                                                          ),
                                                                                          const Text(
                                                                                            'x',
                                                                                            style: TextStyle(fontSize: 16, color: Colors.white),
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            width: 5,
                                                                                          ),
                                                                                          Text(
                                                                                            "${provider.redeemModel?.special?[index].wamfoCoins}",
                                                                                            style: TextStyle(fontSize: 16, color: Colors.white),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ));
                                                            }),
                                                        ////////////////////////////////////////////////////////////
                                                        GridView.builder(
                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisSpacing:
                                                                    0,
                                                                mainAxisSpacing:
                                                                    20,
                                                                crossAxisCount:
                                                                    2),
                                                            itemCount: provider
                                                                .redeemModel
                                                                ?.special
                                                                ?.length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                        10),
                                                                child:
                                                                    Container(
                                                                  height: 100,
                                                                  //  margin: EdgeInsets.only(bottom: 10),
                                                                  // height: double
                                                                  //     .infinity,
                                                                  // width: double
                                                                  //     .infinity,

                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              8),
                                                                          gradient: const LinearGradient(
                                                                              begin: Alignment.topRight,
                                                                              end: Alignment.bottomLeft,
                                                                              colors: [
                                                                                Color(0xffF9DE9B),
                                                                                Color(0xffA34F33),
                                                                                Color(0xffF49E4D),
                                                                              ])),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            3.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          100,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8)),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                10,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              FittedBox(
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Container(
                                                                                  height: 45,
                                                                                  width: 80,
                                                                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xffF1BD79), width: 2), borderRadius: BorderRadius.circular(4)),
                                                                                  child: const Center(
                                                                                    child: FittedBox(
                                                                                      child: Text(
                                                                                        '''Google play \n   Coupon''',
                                                                                        style: TextStyle(
                                                                                          color: Color(0xff8E4940),
                                                                                          fontSize: 14,
                                                                                          // fontWeight: FontWeight.bold
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    const SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Container(height: 40, width: 23, child: Image.asset('assets/common/googleplay.png')),
                                                                                    const SizedBox(
                                                                                      width: 15,
                                                                                    ),
                                                                                    const Text(
                                                                                      'x',
                                                                                      style: TextStyle(color: Color(0xff8E4940)),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Text(
                                                                                      "${provider.redeemModel?.special?[index].rubies}",
                                                                                      style: TextStyle(color: Color(0xff8E4940)),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    showDialog(context: context, builder: (BuildContext context) => const Dialogue1());
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 25,
                                                                                    width: 92,
                                                                                    decoration: BoxDecoration(color: const Color(0xff8E4940), borderRadius: BorderRadius.circular(8)),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Container(height: 20, width: 19, child: Image.asset('assets/common/redeem1.png')),
                                                                                        const SizedBox(
                                                                                          width: 7,
                                                                                        ),
                                                                                        const Text(
                                                                                          'x',
                                                                                          style: TextStyle(fontSize: 16, color: Colors.white),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        Text(
                                                                                          "${provider.redeemModel?.special?[index].rubies}",
                                                                                          style: TextStyle(fontSize: 16, color: Colors.white),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            })
                                                      ]),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ])))),
                  Positioned(
                      top: 40,
                      left: 290,
                      child: Image.asset('assets/common/redeemcoin.png')),
                  Positioned(
                      top: 85,
                      left: 130,
                      child: Image.asset('assets/common/redeemstar.png')),
                ]))
          ])),
        ));
  }

  @override
  RedeemItemVM create() => RedeemItemVM();

  @override
  void initialise(BuildContext context) {}
}

                           
                                                        