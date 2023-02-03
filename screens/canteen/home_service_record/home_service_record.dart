import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/canteen/home_service_record/home_service_record_vm.dart';

class HomeServiceRecord extends StatefulWidget {
  const HomeServiceRecord({super.key});

  @override
  State<HomeServiceRecord> createState() => _HomeServiceRecordState();
}

class _HomeServiceRecordState extends State<HomeServiceRecord>
    with BasePage<HomeServiceRecordVM> {
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
                                SizedBox(
                                  height: 10,
                                ),
                                //  Expanded(
                                //   child: Container(
                                //     // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                //     margin: const EdgeInsets.fromLTRB(40, 40, 40, 80),
                                //     height: double.infinity,
                                //     width: double.infinity,
                                //     decoration: BoxDecoration(
                                //          color: const Color(0xffB07C47),
                                //         // border: Border.all(
                                //         //     color: const Color(0xffB07C47),
                                //         //     width: 10),
                                //         borderRadius: BorderRadius.circular(7)),
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       child: Container(
                                //         color: Color(0xff251B17),
                                //       ),
                                //     ),
                                //   )
                                //  )
                                // CarouselSlider.builder(
                                //   itemCount: 4,

                                //    itemBuilder:((context, index, realIndex) {
                                //      return Expanded(
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(5.0),
                                //     child: Container(
                                //       // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                //         margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                //       height: double.infinity,
                                //       width: double.infinity,
                                //       decoration: BoxDecoration(
                                //            color: const Color(0xffB07C47),
                                //           // border: Border.all(
                                //           //     color: const Color(0xffB07C47),
                                //           //     width: 10),
                                //           borderRadius: BorderRadius.circular(7)),
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(8.0),
                                //         child: Container(

                                //           color: Color(0xff251B17),
                                //         ),
                                //       ),
                                //     ),
                                //   )
                                //  );
                                //    }),
                                //     options: CarouselOptions(

                                //       height: 450
                                //     ))
                                // Expanded(
                                //   child: ListView.separated(
                                //     separatorBuilder: (context, index) {
                                //       return SizedBox(
                                //         width: 40,
                                //       );
                                //     },
                                //     scrollDirection:  Axis.horizontal,
                                //     itemCount: 4,
                                //     itemBuilder: (context, index) {
                                //       return  Center(
                                //         child: Container(
                                //         // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                //         //  margin: const EdgeInsets.fromLTRB(80, 40, 80, 80),
                                //         // height: double.infinity,
                                //         // width: double.infinity,
                                //         // height: 472,
                                //         // width: 340,
                                //         decoration: BoxDecoration(
                                //              color: const Color(0xffB07C47),
                                //             // border: Border.all(
                                //             //     color: const Color(0xffB07C47),
                                //             //     width: 10),
                                //             borderRadius: BorderRadius.circular(7)),
                                //         child: Padding(
                                //           padding: const EdgeInsets.all(8.0),
                                //           child: Container(
                                //              height: 472,
                                //             width: 340,
                                //             color: Color(0xff251B17),
                                //           ),
                                //         ),
                                //         ),
                                //       );
                                //     },),
                                // )
                                Expanded(
                                  child: PageView.builder(
                                    controller: pageController,
                                    itemCount: provider
                                        .homeServiceOtherStudentModel.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                          margin: const EdgeInsets.fromLTRB(
                                              30, 40, 30, 80),
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: const Color(0xffB07C47),
                                              // border: Border.all(
                                              //     color: const Color(0xffB07C47),
                                              //     width: 10),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  color: Color(0xff251B17),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                         provider.homeServiceOtherStudentModel[index].photo !=  "" ?
                                                               
                                                               
                                                                  Container(
                                                                      height:
                                                                          180,
                                                                      width:
                                                                          180,
                                                                      decoration: BoxDecoration(
                                                                        image:DecorationImage(image: NetworkImage("${provider.homeServiceOtherStudentModel[index].photo}",
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
                                                                          180,
                                                                      width:
                                                                          180,
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
                                                                   
                                                                      ),
                                                        // Container(
                                                        //   // color: Colors.red,
                                                        //   height: 180,
                                                        //   width: 180,
                                                        //   decoration: BoxDecoration(
                                                        //     image: DecorationImage(image: NetworkImage("${provider.homeServiceOtherStudentModel[index].photo}"),
                                                        //     fit: BoxFit.cover
                                                        //     ),
                                                        //       borderRadius:
                                                        //           BorderRadius
                                                        //               .circular(
                                                        //                   8)),
                                                        // ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          height: 65,
                                                          width: 250,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Center(
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "${provider.homeServiceOtherStudentModel[index].category}",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          17),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "${provider.homeServiceOtherStudentModel[index].servingDate}",
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                      // "${DateFormat().Format(provider.homeServiceOtherStudentModel[index].serviceDuration) => toString(). substring(2, 7)}",
                                                                      // format(Duration d) => d. toString(). substring(2, 7);
                                                                       "${provider.homeServiceOtherStudentModel[index].serviceDuration}",
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17),
                                                                    ),
                                                                    
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          height: 65,
                                                          width: 310,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Center(
                                                            child: Column(
                                                              children:  [
                                                                Text(
                                                                   "${provider.homeServiceOtherStudentModel[index].reflection}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          17),
                                                                ),
                                                                //  Text('adoloscents are introduced',
                                                                // style: TextStyle(
                                                                //   color: Colors.white,
                                                                //   fontSize: 17
                                                                // ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 25,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                provider.fail(provider
                                                                    .homeServiceOtherStudentModel[
                                                                        index]
                                                                    .id!);
                                                                // Navigator.pushReplacement(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder:
                                                                //             (context) =>
                                                                //                 HomeServiceRecord()));
                                                              },
                                                              child: Container(
                                                                height: 44,
                                                                width: 135,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xff604400),
                                                                      width: 4),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                ),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'FAIL',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff600000),
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                provider.pass(provider
                                                                    .homeServiceOtherStudentModel[
                                                                        index]
                                                                    .id!);
                                                              },
                                                              child: Container(
                                                                height: 44,
                                                                width: 135,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: Color(
                                                                            0xff604400),
                                                                        width:
                                                                            4),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'PASS',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff00600F),
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                        )
                                                      ],
                                                    ),
                                                  ))));
                                    },
                                  ),
                                )
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
  HomeServiceRecordVM create() => HomeServiceRecordVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
