import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/input/input_field.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/home/personal_information/buttons/Button2.dart';
import 'package:wamfo/screens/home/personal_information/buttons/button1.dart';

import 'package:wamfo/screens/home/personal_service_record/service_record_edit/community_service/community_service_input_submit.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_edit/service_record_edit_vm.dart';
import 'package:wamfo/utils/validators.dart';

import '../../../../../components/input/custom_field.dart';

class CommunityServiceInput extends StatefulWidget {
  
  const CommunityServiceInput(
      {super.key,
      required this.ServiceRecordModel,
      required this.servicetype,
      required this.servingdate,
      required this.fromhours,
      required this.fromminutes,
      required this.fromformat,
      required this.tohours,
      required this.tominutes,
      required this.toformat
      // required this.programnature,
      // required this.serviceorganization,
      // required this.personname,
      // required this.personno,
      });
  final ServiceRecordModel;
  final servicetype;
  final servingdate;
  final fromhours;
  final fromminutes;
  final fromformat;
  final tohours;
  final tominutes;
  final toformat;
  // final programnature;
  // final serviceorganization;
  // final personname;
  // final personno;

  @override
  State<CommunityServiceInput> createState() => _CommunityServiceInputState();
}

class _CommunityServiceInputState extends State<CommunityServiceInput>
    with BasePage<ServiceRecordEditVM> {
       final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                      const Profile(),
                      Container(
                height: MediaQuery.of(context).size.height - 185,
                width: MediaQuery.of(context).size.width * 3,
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
                              child: Column(children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                 Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              margin: const EdgeInsets.fromLTRB(30, 5, 30, 30),
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
                                          height: 15,
                                        ),
                                        const Text(
                                          'Community Service',
                                          style: TextStyle(
                                              color: Color(0xff010049),
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Divider(
                                          color: Color(0xff3D5A80),
                                          thickness: 4,
                                          indent: 25,
                                          endIndent: 25,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                'Program Nature',
                                                style: TextStyle(
                                                    color:
                                                        Color(0xff54547C),
                                                    fontSize: 14),
                                              ),
                                              Container(
                                                height: 73,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(8)),
                                                child: TextField(
                                                   style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),
                                                  maxLines: 30,
                                                  decoration:
                                                      InputDecoration(
                                                          // hintText:
                                                          //     "${widget.ServiceRecordModel.programNature}",
                                                          border:
                                                              InputBorder
                                                                  .none),
                                                  controller: provider
                                                      .programNatureController,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                'Serving Organization',
                                                style: TextStyle(
                                                    color:
                                                        Color(0xff54547C),
                                                    fontSize: 14),
                                              ),
                                              Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(8)),
                                                child: TextField(
                                                  
                                                   style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),
                                                    maxLines: 50,
                                                  decoration:
                                                      InputDecoration(
                                                          // hintText:
                                                          //     "${widget.ServiceRecordModel.serviceOrganization}",
                                                          border:
                                                              InputBorder
                                                                  .none),
                                                  controller: provider
                                                      .serviceOrganizationController,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                'Name of Person-in-charge',
                                                style: TextStyle(
                                                    color:
                                                        Color(0xff54547C),
                                                    fontSize: 14),
                                              ),
                                              Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(8)),
                                                child: TextFormField(
                                                   style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),
                                                  
                                                  decoration:
                                                      const InputDecoration(
                                                       
                                                          // hintText:
                                                          //     "${widget.ServiceRecordModel.personInChargeName}",
                                                          border:
                                                              InputBorder
                                                                  .none),
                                                  controller: provider
                                                      .personInChargeNameController,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                'Person-in-charge contact No.',
                                                style: TextStyle(
                                                    color:
                                                        Color(0xff54547C),
                                                    fontSize: 14),
                                              ),
                                              Container(
                                               
                                              
                                                decoration: BoxDecoration( 
                                                    
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(8)),
                                                child: Form(
                                                  key: _key,
                                                  child: ClipRRect(borderRadius: BorderRadius.circular(8),

                                                    child:  CustomField(
                                                      textInputType: TextInputType.number,
                                                      validation: Validators.phone,
                                                    ),
                                                  ),
                                                  // child: TextFormField(
                                                    
                                                    
                                                  //    validator: Validators.phone,
                                                  //    style: const TextStyle(
                                                  //      color: Color(
                                                  //                 0xff010049)
                                                  //     ),
                                                  //   keyboardType: TextInputType.number,
                                                    
                                                  //   decoration:
                                                  //       const InputDecoration(
                                                        
                                                  //       fillColor: Colors.white,constraints:BoxConstraints(minHeight: 30,maxHeight: 30) ,
                                                  //        filled: true,
                                                  //           // hintText:
                                                  //           //     "${widget.ServiceRecordModel.personInChargeContactNo}",
                                                  //           border:
                                                  //               InputBorder
                                                  //                   .none),
                                                  //   controller: provider
                                                  //       .personInChargeContactNoController,
                                                  // ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 91,
                                                child: Button2(
                                                    buttonText: 'Back',
                                                    buttonAction: () {
                                                      Navigator.pop(
                                                          context);
                                                    }),
                                              ),
                                              Container(
                                                height: 50,
                                                width: 91,
                                                child: Button1(
                                                    buttonText: 'Next',
                                                    buttonAction: () {
                                                      // provider
                                                      //     .createServiceRecord(
                                                      //         context);
                                                      if(_key.currentState!.validate()){
                                                        setState(() {});
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      CommunityServiceSubmit(
                                                                        ServiceRecordModel:
                                                                            widget.ServiceRecordModel,
                                                                        personname:
                                                                            provider.personInChargeNameController.text,
                                                                        personno:
                                                                            provider.personInChargeContactNoController.text,
                                                                        programnature:
                                                                            provider.programNatureController.text,
                                                                        serviceorganization:
                                                                            provider.serviceOrganizationController.text,
                                                                        servicetype:
                                                                            widget.servicetype,
                                                                        servingdate:
                                                                            widget.servingdate, fromformat: widget.fromformat, fromhours: widget.fromhours, fromminutes: widget.fromminutes, toformat: widget.toformat, tohours: widget.tohours, tominutes: widget.tominutes,
                                                                            
                                                                      )));
                                                      }
                                                      
                                                    }),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                    )))
                              ]))))
                ]))
                    ]),
            )));
  }

  @override
  ServiceRecordEditVM create() => ServiceRecordEditVM();

  @override
  void initialise(BuildContext context) {}
}
