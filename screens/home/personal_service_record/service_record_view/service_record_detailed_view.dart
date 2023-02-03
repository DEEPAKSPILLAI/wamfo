import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';

import 'package:wamfo/screens/home/personal_service_record/service_record_view/service_record_detailed_view_vm.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_view/service_record_view.dart';

import 'package:wamfo/screens/home/personal_service_record/service_record_view/share_success.dart';

class ServiceRecordDetailedView extends StatefulWidget {
  final serviceId;
  const ServiceRecordDetailedView({super.key, required this.serviceId});

  @override
  State<ServiceRecordDetailedView> createState() =>
      _ServiceRecordDetailedViewState();
}

bool isLoading = false;

class _ServiceRecordDetailedViewState extends State<ServiceRecordDetailedView>
    with BasePage<ServiceRecordDetailedViewVM> {
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          body: Column(children: [
            const Profile(),
            Container(
                height: MediaQuery.of(context).size.height - 185,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/common/home.jpg'),
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
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ServiceRecordView()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'assets/common/back.png'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 5, 20, 5),
                                          margin: const EdgeInsets.fromLTRB(
                                              30, 5, 30, 30),
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: const Color(0xffEEE3D0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff866035),
                                                  width: 6),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                provider.type ?? "",
                                                style: const TextStyle(
                                                    color: Color(0xff010049),
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Divider(
                                                color: Color(0xff3D5A80),
                                                thickness: 4,
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                              Visibility(
                                                visible: provider
                                                        .serviceDetailedView
                                                        ?.isShared ==
                                                    true,
                                                child: const SizedBox(
                                                  height: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 5, 0),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.45,
                                                  //color: Colors.red,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffEEE3D0),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xff010049),
                                                          width: 3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Container(
                                                            height: 136,
                                                            width: 228,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        "${provider.serviceDetailedView?.photo}"),
                                                                    fit: BoxFit
                                                                        .fill),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0))),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: ListView(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Date: ',
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
                                                                  Text(
                                                                    DateFormat(
                                                                            "dd MMMM yyyy")
                                                                        .format(provider
                                                                            .serviceDetailedView!
                                                                            .servingDate!),
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xff010049),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                      'Time: ',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xff54547C),
                                                                          decoration:
                                                                              TextDecoration.underline)),
                                                                  Text(
                                                                    "${provider.serviceDetailedView?.servingFromTime}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xff010049),
                                                                    ),
                                                                  ),
                                                                  Text(" - "),
                                                                  Text(
                                                                    "${provider.serviceDetailedView?.servingToTime}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xff010049),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              const Text(
                                                                'Program Nature:',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color(
                                                                        0xff54547C),
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline),
                                                              ),
                                                              Text(
                                                                "${provider.serviceDetailedView?.programNature}",
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xff010049),
                                                                ),
                                                              ),
                                                              const Text(
                                                                'Serving Organization:',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color(
                                                                        0xff54547C),
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline),
                                                              ),
                                                              Text(
                                                                "${provider.serviceDetailedView?.serviceOrganization}",
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xff010049),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: provider
                                                        .serviceDetailedView
                                                        ?.isShared ==
                                                    false,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      provider.share();
                                                      setState(
                                                        () {
                                                          isLoading = true;
                                                        },
                                                      );
                                                      Future.delayed(
                                                          const Duration(
                                                              seconds: 2), () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const ShareSuccess()));
                                                        isLoading = false;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 69,
                                                      width: 219,
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/common/play_button.png'),
                                                              fit:
                                                                  BoxFit.fill)),
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            isLoading
                                                                ? Container(
                                                                    height: 69,
                                                                    width: 219,
                                                                    decoration: const BoxDecoration(
                                                                        image: DecorationImage(
                                                                            image:
                                                                                AssetImage('assets/common/play_button1.png'),
                                                                            fit: BoxFit.fill)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 16),
                                                                        child:
                                                                            Column(
                                                                          //mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: const [
                                                                            // SizedBox(
                                                                            //   height: 18,
                                                                            // ),
                                                                            Text(
                                                                              'processing',
                                                                              // textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                fontSize: 17,
                                                                                color: Color(0xff010049),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                :
                                                                // const SizedBox(
                                                                //         height: 5,
                                                                //       ),
                                                                const Text(
                                                                    'Share to Canteen',
                                                                    // textAlign: TextAlign.center,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      color: Color(
                                                                          0xff010049),
                                                                    ),
                                                                  ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                          )),
                                    )
                                  ]))))
                ]))
          ]),
        ));
  }

  @override
  ServiceRecordDetailedViewVM create() => ServiceRecordDetailedViewVM();

  @override
  void initialise(BuildContext context) {
    provider.id = widget.serviceId;
    //serviceSelect();
  }
}
