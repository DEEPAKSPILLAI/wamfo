import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/home/personal_information/buttons/Button2.dart';
import 'package:wamfo/screens/home/personal_information/buttons/button1.dart';

import 'package:wamfo/screens/home/personal_service_record/service_record_edit/community_service/community_service_input_success.dart';
import 'package:wamfo/screens/home/personal_service_record/service_record_edit/service_record_edit_vm.dart';

class CommunityServiceSubmit extends StatefulWidget {
  const CommunityServiceSubmit(
      {super.key,
      required this.ServiceRecordModel,
      required this.servicetype,
      required this.servingdate,
      required this.programnature,
      required this.serviceorganization,
      required this.personname,
      required this.personno,
      required this.fromhours,
      required this.fromminutes,
      required this.fromformat,
      required this.tohours,
      required this.tominutes,
      required this.toformat});
  final ServiceRecordModel;
  final servicetype;
  final servingdate;
  final programnature;
  final serviceorganization;
  final personname;
  final personno;
  final fromhours;
  final fromminutes;
  final fromformat;
  final tohours;
  final tominutes;
  final toformat;

  @override
  State<CommunityServiceSubmit> createState() => _CommunityServiceSubmitState();
}

class _CommunityServiceSubmitState extends State<CommunityServiceSubmit>
    with BasePage<ServiceRecordEditVM> {
  bool isChecked = false;
  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      setState(() {
        isChecked = true;
      });
    } else {
      setState(() {
        isChecked = false;
      });
    }
  }

  File? _image;
  String filename = "";

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imagetemp = File(image.path);
    filename = image.path.split('/').last;

    setState(() {
      this._image = imagetemp;
      provider.image1 = imagetemp;
      provider.fileName = filename;
    });
  }

  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                      const Profile(),
                      Container(
                height: MediaQuery.of(context).size.height - 185,
                width: MediaQuery.of(context).size.width ,
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
                                SizedBox(
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
                                                left: 8, right: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                _image != null
                                                    ? Center(
                                                        child: Image.file(
                                                          _image!,
                                                          height: 90,
                                                          width: 100,
                                                        ),
                                                      )
                                                    : GestureDetector(
                                                        onTap: getImage,
                                                        child: Container(
                                                          height: 100,
                                                          //width: 100,
                                                          decoration: BoxDecoration(
                                                              gradient: const LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment.bottomCenter,
                                                                  colors: [
                                                                    Color(
                                                                        0xff98C1D9E5),
                                                                    Color(
                                                                        0xffF1F6FEE5)
                                                                  ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                height: 50,
                                                                width: 50,
                                                                child: Image
                                                                    .asset(
                                                                        'assets/common/upload.png'),
                                                              ),
                                                              const Text(
                                                                ' UPLOAD \n  PHOTO',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    color: Color(
                                                                        0xff00249C)),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text(
                                                  'Reflection',
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xff54547C),
                                                      fontSize: 14),
                                                ),
                                                Container(
                                                  height: 103,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(8)),
                                                  child: TextField(
                                                    maxLines: 30,
                                                    style: const TextStyle(
                                                     color: Color(
                                                                0xff010049)
                                                    ),
                                                    decoration:
                                                        InputDecoration(
                                                            // hintText:
                                                            //     "${widget.ServiceRecordModel.reflection}",
                                                            border:
                                                                InputBorder
                                                                    .none),
                                                    controller: provider
                                                        .reflectionController,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                        height: 21,
                                                        width: 21,
                                                        child: Checkbox(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          value: isChecked,
                                                          onChanged: (value) {
                                                            toggleCheckbox(
                                                                value!);
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          checkColor:
                                                              Colors.white,
                                                          tristate: false,
                                                        )),
                                                    Container(
                                                      child: const Text(
                                                        '''Would you like to share your 
experiances after the teachher's 
approval?''',
                                                         maxLines: 3,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff010049)),
                                                      ),
                                                    ),
                                                  ],
                                                )
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
                                                      buttonText: 'Submit',
                                                      buttonAction: () {
                                                        if (provider
                                                                  .image1 ==
                                                              null) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(const SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    content: Text(
                                                                        "Please Upload Photo")));}

                                                                 {
                                                                if(provider
                                                                  .image1 !=
                                                              null){
                                                                provider
                                                                  .createServiceRecord(
                                                                      context);
                                                              }
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder:
                                                        //             (context) =>
                                                        //                 const CommunityServiceSuccess()));
                                                      }}),
                                                ),
                                              ],
                                            ),
                                          )
                                        ]),
                                      )),
                                )
                              ]))))
                ]))
                    ]),
            )));
  }

  @override
  ServiceRecordEditVM create() => ServiceRecordEditVM();

  @override
  void initialise(BuildContext context) {
    provider.selectedType = widget.servicetype;
    provider.servingDateController.text = widget.servingdate;
    provider.personInChargeContactNoController.text = widget.personno;
    provider.personInChargeNameController.text = widget.personname;
    provider.programNatureController.text = widget.programnature;
    provider.serviceOrganizationController.text = widget.serviceorganization;
    provider.selectedFromHour = widget.fromhours;
    provider.selectedFromMinute = widget.fromminutes;
    provider.selectedFromTimeFormat = widget.fromformat;
    provider.selectedToHour = widget.tohours;
    provider.selectedToMinute = widget.tominutes;
    provider.selectedToTimeFormat = widget.toformat;
    // TODO: implement initialise
  }
}
