import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';

import 'package:wamfo/screens/home/personal_information/buttons/button1.dart';
import 'package:wamfo/screens/home/personal_service_record/personal_service_record.dart';

import 'package:wamfo/screens/home/personal_service_record/service_record_edit/community_service/community_service_input.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_edit/home_service/home_service.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_edit/school_service/school_service.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_edit/service_record_edit_vm.dart';

class ServiceRecordEdit extends StatefulWidget {
  const ServiceRecordEdit({super.key});

  @override
  State<ServiceRecordEdit> createState() => _ServiceRecordEditState();
}

class _ServiceRecordEditState extends State<ServiceRecordEdit>
    with BasePage<ServiceRecordEditVM> {
  // String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
            body: SingleChildScrollView(
          child: Column(children: [
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
                                                height: 20,
                                              ),
                                              const Text(
                                                'Service Record',
                                                style: TextStyle(
                                                    color: Color(0xff010049),
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Divider(
                                                color: Color(0xff3D5A80),
                                                thickness: 4,
                                                indent: 25,
                                                endIndent: 25,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    const Text(
                                                      'Service Type',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff54547C),
                                                          fontSize: 14),
                                                    ),
                                                    Container(
                                                      width: 250,
                                                      height: 33,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton(
                                                        //  iconEnabledColor: 
                                                        //       Color(0xff54547C),
                                                          hint: const Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          8.0),
                                                              child: Text(
                                                                "Please select",
                                                                style:
                                                                    TextStyle(
                                                                       color:
                                                              Color(0xff54547C)
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          value: provider
                                                              .selectedType,
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              provider.selectedType =
                                                                  newValue;
                                                            });
                                                          },
                                                          items: provider
                                                              .serviceTypes
                                                              .map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  v) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: v,
                                                              child: Text(v,
                                                               style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    const Text(
                                                      'Serving Date',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff54547C),
                                                          fontSize: 14),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 33,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: TextFormField(
                                                        // enabled: false,
                                                        onTap:
                                                           () async {
                                                                          DateTime? selectedDate = await showDatePicker(
                                                                              context: context,
                                                                              initialDate: DateTime.now(),
                                                                              firstDate: DateTime(2000),
                                                                              lastDate: DateTime(2025));
                                                                          if (selectedDate !=
                                                                              null) {
                                                                            setState(() {
                                                                              provider.servingDateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
                                                                            });
                                                                          }
                                                                        },
                                                        
                                                         style: const TextStyle(
                                                                                                         color: Color(
                                                                0xff010049)
                                                                                                        ),
                                                        controller: provider
                                                            .servingDateController,
                                                        decoration:
                                                            InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                alignLabelWithHint:
                                                                    true,
                                                                hintText:
                                                                    'Select the Date',
                                                                    hintStyle: TextStyle(
                                                                       color:
                                                              Color(0xff54547C)
                                                                    ),
                                                              //        color:
                                                              // Color(0xff54547C),
                                                                // labelText: 'salect the date',
                                                                suffixIcon:
                                                                    InkWell(
                                                                        child:
                                                                            const Padding(
                                                                          padding:
                                                                              EdgeInsets.only(bottom: 13.0),
                                                                          child:
                                                                              Icon(Icons.date_range),
                                                                        ),
                                                                        onTap:
                                                                            () async {
                                                                          DateTime? selectedDate = await showDatePicker(
                                                                              context: context,
                                                                              initialDate: DateTime.now(),
                                                                              firstDate: DateTime(2000),
                                                                              lastDate: DateTime(2025));
                                                                          if (selectedDate !=
                                                                              null) {
                                                                            setState(() {
                                                                              provider.servingDateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
                                                                            });
                                                                          }
                                                                        }),
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    const Text(
                                                      'Serving Time(From)',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff54547C),
                                                          fontSize: 14),
                                                    ),
                                                    Container(
                                                      height: 33,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            width: 42,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                        color: const Color(
                                                                            0xffE5E7F0),
                                                                        width:
                                                                            1)),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton(
                                                                value: provider
                                                                    .selectedFromHour,
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  setState(() {
                                                                    provider.selectedFromHour =
                                                                        newValue;
                                                                  });
                                                                },
                                                                items: provider
                                                                    .hours
                                                                    .map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value,
                                                                         style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                          // const SizedBox(
                                                          //   width: 6,
                                                          // ),
                                                          const Text(':'),
                                                          // const SizedBox(
                                                          //   width: 6,
                                                          // ),
                                                          Container(
                                                            width: 50,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                        color: const Color(
                                                                            0xffE5E7F0),
                                                                        width:
                                                                            1)),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton(
                                                                value: provider
                                                                    .selectedFromMinute,
                                                                items: provider
                                                                    .minutes
                                                                    .map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value,
                                                                         style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),),
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    provider.selectedFromMinute =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          // const SizedBox(
                                                          //   width: 6,
                                                          // ),
                                                          const Text(':'),
                                                          // const SizedBox(
                                                          //   width: 6,
                                                          // ),
                                                          Container(
                                                            width: 56,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                        color: const Color(
                                                                            0xffE5E7F0),
                                                                        width:
                                                                            1)),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton(
                                                                // hint: const Text(
                                                                //     '10'),
                                                                value: provider
                                                                    .selectedFromTimeFormat,

                                                                items: provider
                                                                    .timeFormat
                                                                    .map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value,
                                                                         style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),),
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    provider.selectedFromTimeFormat =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          // const SizedBox(
                                                          //   width: 18,
                                                          // ),
                                                          const Icon(
                                                              Icons.access_time)
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    const Text(
                                                      'Serving Time(To)',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff54547C),
                                                          fontSize: 14),
                                                    ),
                                                    Container(
                                                      height: 33,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            width: 42,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                        color: const Color(
                                                                            0xffE5E7F0),
                                                                        width:
                                                                            1)),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton(
                                                                value: provider
                                                                    .selectedToHour,
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  setState(() {
                                                                    provider.selectedToHour =
                                                                        newValue;
                                                                  });
                                                                },
                                                                items: provider
                                                                    .hours
                                                                    .map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value,
                                                                         style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                          // const SizedBox(
                                                          //   width: 6,
                                                          // ),
                                                          const Text(':'),
                                                          // const SizedBox(
                                                          //   width: 6,
                                                          // ),
                                                          Container(
                                                            width: 50,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                        color: const Color(
                                                                            0xffE5E7F0),
                                                                        width:
                                                                            1)),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton(
                                                                value: provider
                                                                    .selectedToMinute,
                                                                items: provider
                                                                    .minutes
                                                                    .map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value,
                                                                         style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),),
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    provider.selectedToMinute =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          // const SizedBox(
                                                          //   width: 6,
                                                          // ),
                                                          const Text(':'),
                                                          // const SizedBox(
                                                          //   width: 6,
                                                          // ),
                                                          Container(
                                                            width: 56,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                        color: const Color(
                                                                            0xffE5E7F0),
                                                                        width:
                                                                            1)),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton(
                                                                value: provider
                                                                    .selectedToTimeFormat,
                                                                items: provider
                                                                    .timeFormat
                                                                    .map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value,
                                                                         style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),),
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    provider.selectedToTimeFormat =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          // const SizedBox(
                                                          //   width: 23,
                                                          // ),
                                                          const Icon(
                                                              Icons.access_time)
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 9),
                                                  child: Container(
                                                    height: 50,
                                                    width: 91,
                                                    child: Button1(
                                                        buttonText: 'Next',
                                                        buttonAction: () {
                                                          // provider
                                                          //     .createServiceRecord(
                                                          //         context);

                                                          if (provider
                                                                  .selectedType ==
                                                              null) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(const SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    content: Text(
                                                                        "Please Select Service Type")));
                                                          } else if (provider
                                                                  .servingDateController
                                                                  .text ==
                                                              "") {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                                        content:
                                                                            Text("Please Select Serving Date")));
                                                          } else if (provider
                                                                      .selectedType ==
                                                                  "School Service" &&
                                                              provider.servingDateController
                                                                      .text !=
                                                                  "") {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            SchoolServiceInput(
                                                                              ServiceRecordModel: provider.serviceRecord,
                                                                              servicetype: provider.selectedType,
                                                                              servingdate: provider.servingDateController.text,
                                                                              fromformat: provider.selectedFromTimeFormat,
                                                                              fromhours: provider.selectedFromHour,
                                                                              fromminutes: provider.selectedFromMinute,
                                                                              toformat: provider.selectedToTimeFormat,
                                                                              tohours: provider.selectedToHour,
                                                                              tominutes: provider.selectedToMinute,
                                                                            )));
                                                          } else if (provider
                                                                      .selectedType ==
                                                                  "Home Service" &&
                                                              provider.servingDateController
                                                                      .text !=
                                                                  "") {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            HomeServiceInput(
                                                                              ServiceRecordModel: provider.serviceRecord,
                                                                              servicetype: provider.selectedType,
                                                                              servingdate: provider.servingDateController.text,
                                                                              fromformat: provider.selectedFromTimeFormat,
                                                                              fromhours: provider.selectedFromHour,
                                                                              fromminutes: provider.selectedFromMinute,
                                                                              toformat: provider.selectedToTimeFormat,
                                                                              tohours: provider.selectedToHour,
                                                                              tominutes: provider.selectedToMinute,
                                                                            )));
                                                          } else if (provider
                                                                      .selectedType ==
                                                                  "Community Service" &&
                                                              provider.servingDateController
                                                                      .text !=
                                                                  "") {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CommunityServiceInput(
                                                                  ServiceRecordModel:
                                                                      provider
                                                                          .serviceRecord,
                                                                  servicetype:
                                                                      provider
                                                                          .selectedType,
                                                                  servingdate:
                                                                      provider
                                                                          .servingDateController
                                                                          .text,
                                                                  fromformat:
                                                                      provider
                                                                          .selectedFromTimeFormat,
                                                                  fromhours:
                                                                      provider
                                                                          .selectedFromHour,
                                                                  fromminutes:
                                                                      provider
                                                                          .selectedFromMinute,
                                                                  toformat: provider
                                                                      .selectedToTimeFormat,
                                                                  tohours: provider
                                                                      .selectedToHour,
                                                                  tominutes:
                                                                      provider
                                                                          .selectedToMinute,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        }),
                                                  ),
                                                ),
                                              )
                                            ]),
                                          )),
                                    ),
                                  ]))))
                ]))
          ]),
        )));
  }

  @override
  ServiceRecordEditVM create() => ServiceRecordEditVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
