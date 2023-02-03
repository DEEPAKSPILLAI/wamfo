import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/models/service_record_view_model.dart';
import 'package:wamfo/screens/home/personal_service_record/personal_service_record.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_view/service_record_detailed_view.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_view/service_record_view_vm.dart';

import '../../../../base/base_page.dart';

class ServiceRecordView extends StatefulWidget {
  const ServiceRecordView({super.key});

  @override
  State<ServiceRecordView> createState() => _ServiceRecordViewState();
}

class _ServiceRecordViewState extends State<ServiceRecordView>
    with BasePage<ServiceRecordViewVM>, SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

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
                                                  const PersonalServiceRecord()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Image.asset('assets/common/back.png'),
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
                                              color: const Color(0xff866035),
                                              width: 6),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Service Record',
                                            style: TextStyle(
                                                color: Color(0xff010049),
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Divider(
                                            color: Color(0xff3D5A80),
                                            thickness: 4,
                                            indent: 20,
                                            endIndent: 20,
                                          ),
                                          const SizedBox(
                                            height: 0,
                                          ),
                                          Container(
                                            child: TabBar(
                                                indicatorSize:
                                                    TabBarIndicatorSize.label,
                                                indicatorPadding:
                                                    EdgeInsets.zero,
                                                indicatorColor:
                                                    const Color(0xff595959),
                                                indicatorWeight: 3.0,
                                                labelColor:
                                                    const Color(0xff010049),
                                                // labelPadding: const EdgeInsets.all(0),
                                                controller: _controller,
                                                tabs: const [
                                                  Text(
                                                    'Shared',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  //  Tab(text: 'Shared',

                                                  Text('Private',
                                                      style: TextStyle(
                                                          fontSize:
                                                              20)), // Tab(text: 'Private',)
                                                ]),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                  height: 237,
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
                                                  child: TabBarView(
                                                      controller: _controller,
                                                      children: [
                                                        ListView.separated(
                                                          itemCount: provider
                                                                  .serviceView
                                                                  ?.sharedRecordCount ??
                                                              0,
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return const Divider(
                                                              color: Color(
                                                                  0xff010049),
                                                              thickness: 2,
                                                              indent: 10.0,
                                                              endIndent: 10.0,
                                                            );
                                                          },
                                                          itemBuilder:
                                                              ((BuildContext
                                                                      context,
                                                                  int index) {
                                                            if (provider
                                                                    .serviceView
                                                                    ?.sharedRecords?[
                                                                        index]
                                                                    .serviceType ==
                                                                "home") {
                                                              provider.tempType =
                                                                  "Home Service";
                                                            } else if (provider
                                                                    .serviceView
                                                                    ?.sharedRecords?[
                                                                        index]
                                                                    .serviceType ==
                                                                "school") {
                                                              provider.tempType =
                                                                  "School Service";
                                                            } else if (provider
                                                                    .serviceView
                                                                    ?.sharedRecords?[
                                                                        index]
                                                                    .serviceType ==
                                                                "community") {
                                                              provider.tempType =
                                                                  "Community Service";
                                                            } else {
                                                              provider.tempType =
                                                                  "";
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

                                                            return InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ServiceRecordDetailedView(
                                                                              serviceId: provider.serviceView?.sharedRecords?[index].id,
                                                                            )));
                                                              },
                                                              child: ListTile(
                                                                title: Text(
                                                                  "${provider.tempType}",
                                                                  //${provider.serviceView?.sharedRecords?[index].id
                                                                  style: const TextStyle(
                                                                    decoration: TextDecoration.underline,
                                                                    decorationColor:  Color(
                                                                          0xff54547C),
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xff010049)),
                                                                ),
                                                                subtitle: Text(
                                                                  DateFormat(
                                                                          "dd MMMM yyyy")
                                                                      .format(provider
                                                                          .tempDate!),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xff54547C)),
                                                                ),
                                                                leading:
                                                                    CircleAvatar(
                                                                  radius: 30,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          "${provider.serviceView?.sharedRecords?[index].photo}"),
                                                                ),
                                                                trailing:
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => ServiceRecordDetailedView(
                                                                                        serviceId: provider.serviceView?.sharedRecords?[index].id,
                                                                                      )));
                                                                        },
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .arrow_forward_ios,
                                                                          color:
                                                                              Color(0xff010049),
                                                                        )),
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                        /////////////////////////////////////////////////////

                                                        ListView.separated(
                                                          itemCount: provider
                                                                  .serviceView
                                                                  ?.privateRecordCount ??
                                                              0,
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return const Divider(
                                                              color: Color(
                                                                  0xff010049),
                                                              thickness: 2,
                                                              indent: 10.0,
                                                              endIndent: 10.0,
                                                            );
                                                          },
                                                          itemBuilder:
                                                              ((BuildContext
                                                                      context,
                                                                  int index) {
                                                            if (provider
                                                                    .serviceView
                                                                    ?.privateRecords?[
                                                                        index]
                                                                    .serviceType ==
                                                                "home") {
                                                              provider.tempType =
                                                                  "Home Service";
                                                            } else if (provider
                                                                    .serviceView
                                                                    ?.privateRecords?[
                                                                        index]
                                                                    .serviceType ==
                                                                "school") {
                                                              provider.tempType =
                                                                  "School Service";
                                                            } else if (provider
                                                                    .serviceView
                                                                    ?.privateRecords?[
                                                                        index]
                                                                    .serviceType ==
                                                                "community") {
                                                              provider.tempType =
                                                                  "Community Service";
                                                            } else {
                                                              provider.tempType =
                                                                  "";
                                                            }
                                                            provider.tempStringDate =
                                                                provider
                                                                    .serviceView
                                                                    ?.privateRecords?[
                                                                        index]
                                                                    .servingDate;

                                                            provider.tempDate =
                                                                DateTime.parse(
                                                                    provider.tempStringDate ??
                                                                        "");
                                                            return InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ServiceRecordDetailedView(
                                                                              serviceId: provider.serviceView?.privateRecords?[index].id,
                                                                            )));
                                                              },
                                                              child: ListTile(
                                                                title: Text(
                                                                  "${provider.tempType}",
                                                                  style: const TextStyle(
                                                                    decoration: TextDecoration.underline,
                                                                    decorationColor:  Color(
                                                                          0xff54547C),
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xff010049)),
                                                                ),
                                                                subtitle: Text(
                                                                  DateFormat(
                                                                          "dd MMMM yyyy")
                                                                      .format(provider
                                                                          .tempDate!),
                                                                  style: const TextStyle(
                                                                    
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xff54547C)),
                                                                ),
                                                                leading:
                                                                    CircleAvatar(
                                                                  radius: 30,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          "${provider.serviceView?.privateRecords?[index].photo}"),
                                                                ),
                                                                trailing:
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => ServiceRecordDetailedView(
                                                                                        serviceId: provider.serviceView?.privateRecords?[index].id,
                                                                                      )));
                                                                        },
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .arrow_forward_ios,
                                                                          color:
                                                                              Color(0xff010049),
                                                                        )),
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      ])),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ]))))
              ]))
        ])));
  }

  @override
  ServiceRecordViewVM create() => ServiceRecordViewVM();

  @override
  void initialise(BuildContext context) {}
}
