import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/home/recovery_vitality/recovery_vitality_vm.dart';

import '../../../base/base_page.dart';

class RecoveryVitality extends StatefulWidget {
  const RecoveryVitality({super.key});

  @override
  State<RecoveryVitality> createState() => _RecoveryVitalityState();
}

class _RecoveryVitalityState extends State<RecoveryVitality>
    with BasePage<RecoveryVitalityVM>{
  @override
  Widget build(BuildContext context) {
    return builder(() => 
           Scaffold(
        body:  Column(
        children: [
          const Profile(),
          Container(
              height: MediaQuery.of(context).size.height -185,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/common/home.jpg'),
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
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/common/back.png'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              margin: const EdgeInsets.fromLTRB(30, 5, 30, 30),
                              height: double.infinity,
                              width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffA03D26),
                                      border: Border.all(
                                          color: const Color(0xff6B2B1E),
                                          width: 6),
                                      // borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Column(
                                      children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                     
                                      const Text(
                                        'Recovery Vitality',
                                        style: TextStyle(
                                            color: Color(0xffFFEAB8),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 0,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          
                                          itemCount: provider.vitalityModel.length,
                                          itemBuilder:(BuildContext context,int index){ 
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Container(
                                              height: 71,
                                              width: 272,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffFFEAB8),
                                                  border: Border.all(
                                                      color: const Color(0xffFFC46D),
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(8.0)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 115,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              const Color(0xffF1BD79),
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(4),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                            height: 17,
                                                            width: 20,
                                                            child: Image.asset(
                                                                'assets/common/love.png')),
                                                        const SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text('x',
                                                        style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Color(0xff8E4940)),),
                                                                  const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "${provider.vitalityModel[index].vitality}",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Color(0xff8E4940)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 0,
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xff8E4940),
                                                        borderRadius:
                                                            BorderRadius.circular(8)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                            height: 20,
                                                            width: 19,
                                                            child: Image.asset(
                                                                'assets/common/coin.png')),
                                                        const SizedBox(
                                                          width: 7,
                                                        ),
                                                         Text('x',
                                                         style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                 Colors.white),),
                                                                 const SizedBox(
                                                          width: 5,
                                                        ),
                                                         Text(
                                                         " ${provider.vitalityModel[index].wamfoCoins}",
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                          }
                                        ),
                                      ),
                                      ////////////////////////////////////////////
                                      // const SizedBox(
                                      //   height: 15,
                                      // ),
                                      // Container(
                                      //   height: 71,
                                      //   width: 272,
                                      //   decoration: BoxDecoration(
                                      //       color: const Color(0xffFFEAB8),
                                      //       border: Border.all(
                                      //           color: const Color(0xffFFC46D),
                                      //           width: 2),
                                      //       borderRadius:
                                      //           BorderRadius.circular(8.0)),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceEvenly,
                                      //     children: [
                                      //       Container(
                                      //         height: 30,
                                      //         width: 133,
                                      //         decoration: BoxDecoration(
                                      //             border: Border.all(
                                      //                 color: const Color(
                                      //                     0xffF1BD79),
                                      //                 width: 2),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(4)),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             Container(
                                      //                 height: 17,
                                      //                 width: 20,
                                      //                 child: Image.asset(
                                      //                     'assets/common/love.png')),
                                      //             const SizedBox(
                                      //               width: 7,
                                      //             ),
                                      //              Text('x',
                                      //              style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                       Color(0xff8E4940)),),
                                      //              Text(
                                      //               "${provider.vitalityModel[1].wamfoCoins}",
                                      //               style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                       Color(0xff8E4940)),
                                      //             )
                                      //           ],
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         height: 30,
                                      //         width: 92,
                                      //         decoration: BoxDecoration(
                                      //             color:
                                      //                 const Color(0xff8E4940),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(8)),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             Container(
                                      //                 height: 20,
                                      //                 width: 19,
                                      //                 child: Image.asset(
                                      //                     'assets/common/coin.png')),
                                      //             const SizedBox(
                                      //               width: 7,
                                      //             ), Text('x',
                                      //             style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                       Colors.white),),
                                      //              Text(
                                      //               "${provider.vitalityModel[1].wamfoCoins}",
                                      //               style: TextStyle(
                                      //                   fontSize: 20,
                                      //                   color: Colors.white),
                                      //             )
                                      //           ],
                                      //         ),
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),
                                      // //////////////////////////////////////////////////////
                                      // const SizedBox(
                                      //   height: 15,
                                      // ),
                                      // Container(
                                      //   height: 71,
                                      //   width: 272,
                                      //   decoration: BoxDecoration(
                                      //       color: const Color(0xffFFEAB8),
                                      //       border: Border.all(
                                      //           color: const Color(0xffFFC46D),
                                      //           width: 2),
                                      //       borderRadius:
                                      //           BorderRadius.circular(8.0)),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceEvenly,
                                      //     children: [
                                      //       Container(
                                      //         height: 30,
                                      //         width: 133,
                                      //         decoration: BoxDecoration(
                                      //             border: Border.all(
                                      //                 color: const Color(
                                      //                     0xffF1BD79),
                                      //                 width: 2),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(4)),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             Container(
                                      //                 height: 17,
                                      //                 width: 20,
                                      //                 child: Image.asset(
                                      //                     'assets/common/love.png')),
                                      //             const SizedBox(
                                      //               width: 7,
                                      //             ),
                                      //             Text('x',
                                      //             style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                       Color(0xff8E4940)),),
                                      //              Text(
                                      //               "${provider.vitalityModel[1].wamfoCoins}",
                                      //               style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                       Color(0xff8E4940)),
                                      //             )
                                      //           ],
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         height: 30,
                                      //         width: 92,
                                      //         decoration: BoxDecoration(
                                      //             color:
                                      //                 const Color(0xff8E4940),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(8)),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             Container(
                                      //                 height: 20,
                                      //                 width: 19,
                                      //                 child: Image.asset(
                                      //                     'assets/common/coin.png')),
                                      //             const SizedBox(
                                      //               width: 7,
                                      //             ),
                                      //             Text('x',
                                      //             style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                      Colors.white),),
                                      //             Text(
                                      //               "${provider.vitalityModel[1].wamfoCoins}",
                                      //               style: TextStyle(
                                      //                   fontSize: 20,
                                      //                   color: Colors.white),
                                      //             )
                                      //           ],
                                      //         ),
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),
                                      // /////////////////////////////////////////////////////
                                      // const SizedBox(
                                      //   height: 15,
                                      // ),
                                      // Container(
                                      //   height: 71,
                                      //   width: 272,
                                      //   decoration: BoxDecoration(
                                      //       color: const Color(0xffFFEAB8),
                                      //       border: Border.all(
                                      //           color: const Color(0xffFFC46D),
                                      //           width: 2),
                                      //       borderRadius:
                                      //           BorderRadius.circular(8.0)),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceEvenly,
                                      //     children: [
                                      //       Container(
                                      //         height: 30,
                                      //         width: 133,
                                      //         decoration: BoxDecoration(
                                      //             border: Border.all(
                                      //                 color: const Color(
                                      //                     0xffF1BD79),
                                      //                 width: 2),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(4)),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             Container(
                                      //                 height: 17,
                                      //                 width: 20,
                                      //                 child: Image.asset(
                                      //                     'assets/common/love.png')),
                                      //             const SizedBox(
                                      //               width: 7,
                                      //             ),
                                      //             Text('x',
                                      //             style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                        Color(0xff8E4940)),),
                                      //            Text(
                                      //               "${provider.vitalityModel[1].wamfoCoins}",
                                      //               style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                       Color(0xff8E4940)),
                                      //             )
                                      //           ],
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         height: 30,
                                      //         width: 92,
                                      //         decoration: BoxDecoration(
                                      //             color:
                                      //                 const Color(0xff8E4940),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(8)),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             Container(
                                      //                 height: 20,
                                      //                 width: 19,
                                      //                 child: Image.asset(
                                      //                     'assets/common/coin.png')),
                                      //             const SizedBox(
                                      //               width: 7,
                                      //             ),
                                      //             Text('x',
                                      //             style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color:
                                      //                      Colors.white),),
                                      //             Text(
                                      //               "${provider.vitalityModel[1].wamfoCoins}",
                                      //               style: TextStyle(
                                      //                   fontSize: 20,
                                      //                   color: Colors.white),
                                      //             )
                                      //           ],
                                      //         ),
                                      //       )
                                          //],
                                        //),
                                      //),
                                    ])),
                              )
                        ]
                              )
                    )))
                            ]
                            )
                            )
        ]
                            )
           )
                            );
          
    
    
  }

   @override
 RecoveryVitalityVM create() => RecoveryVitalityVM();
  @override
  void initialise(BuildContext context) {}
}


