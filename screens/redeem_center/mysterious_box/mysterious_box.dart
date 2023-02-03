import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/redeem_center/mysterious_box/carousel_mistbox.dart';
import 'package:wamfo/screens/redeem_center/mysterious_box/mysterious_box_vm.dart';
import 'package:wamfo/screens/redeem_center/mysterious_box/mysterious_character/mysterious_rare.dart';

class MysteriousBox extends StatefulWidget {
  const MysteriousBox({super.key});

  @override
  State<MysteriousBox> createState() => _MysteriousBoxState();
}

class _MysteriousBoxState extends State<MysteriousBox>
    with BasePage<MysteriousBoxVM>, SingleTickerProviderStateMixin {
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
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'assets/common/back.png'),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                            margin: const EdgeInsets.fromLTRB(
                                                50, 0, 20, 40),
                                            height: double.infinity,
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    colors: [
                                                  Color(0xffF9DE9B),
                                                  Color(0xffA34F33),
                                                  Color(0xffF49E4D),
                                                ])),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Container(
                                                    // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                                    // margin: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration:
                                                         const BoxDecoration(
                                                      color: Color(0xffAB5736),
                                                      boxShadow:[ BoxShadow(
                                                        // color:  Color(0xffAB5740),
                                                        color: Colors.grey,
                                                        offset: Offset(0, 0)
                                                      )]
                                                    ),
                                                    child: Column(children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      const Text(
                                                        'Mysterious Box',
                                                        style: TextStyle(
                                                            shadows: <Shadow>[
                                                              Shadow(
                                                                  offset:
                                                                      Offset(
                                                                          2, 1),
                                                                  color: Color(
                                                                      0xff92502A80))
                                                            ],
                                                            color: Color(
                                                                0xffFFD440),
                                                            fontSize: 32,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        child: TabBar(
                                                            indicatorSize:
                                                                TabBarIndicatorSize
                                                                    .label,
                                                            indicatorPadding:
                                                                EdgeInsets.zero,
                                                            indicatorColor:
                                                                Colors.white,
                                                            indicatorWeight:
                                                                3.0,
                                                            labelColor:
                                                                const Color(
                                                                    0xffE59053),
                                                            controller:
                                                                _controller,
                                                            tabs: const [
                                                              Text(
                                                                'Character',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              Text('Gear',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20)),
                                                            ]),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Expanded(
                                                        child: TabBarView(
                                                            controller:
                                                                _controller,
                                                            children: [
                                                              ListView(
                                                                            children: [
                                                                              CarouselSlider(
                                                                                items:[
                                                                                  CarouselMistbox1(
                                                                                    carouselimage: 'assets/common/redeemcoin.png', 
                                                                                    carouseltext: '40'),
                                                                                    CarouselMistbox1(
                                                                                    carouselimage: 'assets/common/redeem1.png', 
                                                                                    carouseltext: '1'),
                                                                                    CarouselMistbox1(
                                                                                    carouselimage: 'assets/common/redeem1.png', 
                                                                                    carouseltext: '3'),
                                                                                    CarouselMistbox1(
                                                                                    carouselimage: 'assets/common/redeem1.png', 
                                                                                    carouseltext: '5'),
                                                                                    CarouselMistbox1(
                                                                                    carouselimage: 'assets/common/redeem1.png', 
                                                                                    carouseltext: '10'),
                                                                                  
                                                                                ],
                                                                                 options: CarouselOptions(
                                                                                  viewportFraction: 1.0,
                                                                                  // aspectRatio: 16/16,
                                                                                  enableInfiniteScroll: false,
                                                                                  height: 380,
                                                                                  enlargeCenterPage: true
                                                                                 ))
                                                                            ],
                                                                  
                                                                  ),
                                                                 /////////////////////////////////////////////////
                                                                           ListView(
                                                                            children: [
                                                                              CarouselSlider(
                                                                                items:[
                                                                                  CarouselMistbox(
                                                                                    carouselimage: 'assets/common/redeemcoin.png', 
                                                                                    carouseltext: '30'),
                                                                                    CarouselMistbox(
                                                                                    carouselimage: 'assets/common/redeem1.png', 
                                                                                    carouseltext: '3'),
                                                                                  
                                                                                ],
                                                                                 options: CarouselOptions(
                                                                                  // viewportFraction: 1.0,
                                                                                  // aspectRatio: 16/9,
                                                                                  enableInfiniteScroll: false,
                                                                                  height: 350,
                                                                                
                                                                                  enlargeCenterPage: true
                                                                                 ))
                                                                            ],
                                                                  
                                                                  ),
                                                            ]),
                                                      )
                                                    ]
                                                    )
                                                    )
                                                    )
                                                    )
                                                    ),
                                                    
                                  ]
                                  )
                                  )
                                  )
                                  ),
                                 
                                  //  Container(
                                  //                     height: 120,
                                  //                     color: Colors.red,
                                                    //),
                  Positioned(
                      top: 555,
                      left: 240,
                      child: Container(
                        height:100,
                        width: 155,
                        child: Image.asset('assets/common/goldright.png'))),
                  Positioned(
                      top: 540,
                      right: 246,
                      child: Container(
                        height: 100,
                        width: 155,
                        child: Image.asset('assets/common/goldleft.png'))),
                  Positioned(
                      top: 85,
                      left: 90,
                      child: Image.asset('assets/common/redeemstar.png')),
                ]))
                      ])),
        ));
  }

  @override
  MysteriousBoxVM create() => MysteriousBoxVM();

  @override
  void initialise(BuildContext context) {}
}
