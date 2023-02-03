import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/canteen/shared_experience/shared_record_screen_vm.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_view/service_record_view_vm.dart';

class SharedRecordScreen extends StatefulWidget {
  const SharedRecordScreen({super.key});

  @override
  State<SharedRecordScreen> createState() => _SharedRecordScreenState();
}

class _SharedRecordScreenState extends State<SharedRecordScreen>
    with BasePage<ServiceRecordViewVM> {
      
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/common/canteen_blur.png'),
              ),
            ),
            child: Stack(children: [
              ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                      child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Profile(),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child:
                                        Image.asset('assets/common/back.png'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                // Padding(
                                //   padding: const EdgeInsets.only(left: 50, top: 30),
                                //   child:
                                Expanded(
                                    child: PageView.builder(
                                        controller: pageController,
                                        itemCount: provider
                                            .serviceView?.sharedRecordCount,
                                        itemBuilder: (context, index) {
                                          if (provider
                                                  .serviceView?.sharedRecords?[index]
                                                  
                                                  .serviceType ==
                                              "home") {
                                            provider.tempType = "Home Service";
                                          } else if (provider.serviceView?.sharedRecords?[index]
                                                  .serviceType ==
                                              "school") {
                                            provider.tempType =
                                                "School Service";
                                          } else if (provider.serviceView?.sharedRecords?[index]
                                                  .serviceType ==
                                              "community") {
                                            provider.tempType =
                                                "Community Service";
                                          } else {
                                            provider.tempType = "";

                                          }

                                            provider.tempStringDate =
                                                                provider
                                                                    .serviceView
                                                                    ?.sharedRecords?[
                                                                        index]
                                                                    .servingDate;

                                                            provider.tempDate =
                                                                DateTime.parse(
                                                                    provider.tempStringDate ??
                                                                        "");
                                          return Container(
                                              // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                              margin: const EdgeInsets.fromLTRB(
                                                  30, 10, 30, 40),
                                              height: double.infinity,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffA45526),
                                                  // border: Border.all(
                                                  //     color: const Color(0xffB07C47),
                                                  //     width: 10),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      color: Color(0xffFFE8C6),
                                                      child:
                                                          SingleChildScrollView(
                                                              child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 25,
                                                                right: 10,
                                                                top: 15),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${provider.tempType}",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff635300),
                                                                  fontSize: 22,
                                                                  // decoration: TextDecoration.underline
                                                                ),
                                                              ),
                                                              Divider(
                                                                indent: 3,
                                                                endIndent: 2,
                                                                thickness: 2,
                                                                color: Color(
                                                                    0xff3D5A80),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children:  [
                                                                      Text(
                                                                        'Student Name: ',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Color(0xff54547C),
                                                                            decoration: TextDecoration.underline),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "${provider.serviceView?.sharedRecords?[index].userEnglishName}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff010049),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    children:  [
                                                                      Text(
                                                                        'Date: ',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Color(0xff54547C),
                                                                            decoration: TextDecoration.underline),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        DateFormat(
                                                                          "dd MMMM yyyy")
                                                                      .format(provider
                                                                          .tempDate!),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff010049),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  // Row(
                                                                  //   children: const [
                                                                  //     Text(
                                                                  //         'Time: ',
                                                                  //         style: TextStyle(
                                                                  //             fontSize:
                                                                  //                 16,
                                                                  //             fontWeight: FontWeight
                                                                  //                 .bold,
                                                                  //             color: Color(
                                                                  //                 0xff54547C),
                                                                  //             decoration:
                                                                  //                 TextDecoration.underline)),
                                                                  //     Text(
                                                                  //       "",
                                                                  //       style:
                                                                  //           TextStyle(
                                                                  //         fontSize:
                                                                  //             16,
                                                                  //         fontWeight:
                                                                  //             FontWeight
                                                                  //                 .bold,
                                                                  //         color: Color(
                                                                  //             0xff010049),
                                                                  //       ),
                                                                  //     ),
                                                                  //     Text(" - "),
                                                                  //     Text(
                                                                  //       "",
                                                                  //       style:
                                                                  //           TextStyle(
                                                                  //         fontSize:
                                                                  //             16,
                                                                  //         fontWeight:
                                                                  //             FontWeight
                                                                  //                 .bold,
                                                                  //         color: Color(
                                                                  //             0xff010049),
                                                                  //       ),
                                                                  //     )
                                                                  //   ],
                                                                  // ),
                                                                  Visibility(
                                                                    visible:provider.serviceView?.sharedRecords?[index].serviceType=="community" ,
                                                                    child: SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                  ),
                                                                   Visibility(
                                                                    visible:provider.serviceView?.sharedRecords?[index].serviceType=="community" ,
                                                                    child: const Text(
                                                                      'Program Nature:',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          color: Color(
                                                                              0xff54547C),
                                                                          decoration:
                                                                              TextDecoration.underline),
                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible:provider.serviceView?.sharedRecords?[index].serviceType=="community" ,
                                                                    child: SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                  ),
                                                                   Visibility(
                                                                    visible:provider.serviceView?.sharedRecords?[index].serviceType=="community" ,
                                                                     child: Text(
                                                                      "${provider.serviceView?.sharedRecords?[index].programNature}",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Color(
                                                                            0xff010049),
                                                                      ),
                                                                                                                                     ),
                                                                   ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  const Text(
                                                                    'Reflection:',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Color(
                                                                            0xff54547C),
                                                                        decoration:
                                                                            TextDecoration.underline),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                   Text(
                                                                    "${provider.serviceView?.sharedRecords?[index].reflection}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xff010049),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  const Text(
                                                                    'Photo:',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Color(
                                                                            0xff54547C),
                                                                        decoration:
                                                                            TextDecoration.underline),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                   provider.serviceView?.sharedRecords?[index].photo != "null" ?
                                                               
                                                               
                                                                  Container(
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          100,
                                                                      decoration: BoxDecoration(
                                                                        image:DecorationImage(image: NetworkImage("${provider.serviceView?.sharedRecords?[index].photo}",
                                                                        // fit: BoxFit
                                                                        //     .cover,
                                                                      ),
                                                                      fit: BoxFit.cover),
                                                                         
                                                                          // color: Colors
                                                                          //     .red,
                                                                          borderRadius: BorderRadius.circular(
                                                                              8)),
                                                                              
                                                                    
                                                                      
                                                                      )
                                                                      :
                                                                      Container(
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          100,
                                                                      decoration: BoxDecoration(
                                                                         image:const DecorationImage(image: AssetImage("assets/common/no image.png",
                                                                        // fit: BoxFit
                                                                        //     .cover,
                                                                      ),
                                                                      fit: BoxFit.cover),
                                                                          // color: Colors
                                                                          //     .red,
                                                                          borderRadius: BorderRadius.circular(
                                                                              8)),
                                                                      // child:
                                                                      // Image
                                                                      //     .asset(
                                                                      //   "assets/common/no image.png",
                                                                      //   fit: BoxFit
                                                                      //       .cover,
                                                                            
                                                                      // )
                                                                      )
                                                                ],
                                                              ),
                                                            ]),
                                                      )))));
                                        }))
                              ])))),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                                setState(() {});
                              },
                              child: Image.asset(
                                'assets/common/left.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                                setState(() {});
                              },
                              child: Image.asset(
                                'assets/common/right.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ]))));
  }

  @override
  ServiceRecordViewVM create() => ServiceRecordViewVM();
  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
