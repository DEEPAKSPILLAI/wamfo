import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:wamfo/base/base_page.dart';

import 'package:wamfo/components/profile/profile.dart';

import 'package:wamfo/screens/home/personal_information/buttons/button1.dart';

import 'package:wamfo/screens/home/personal_information/personal_info_edit_vm.dart';

class PersonalInfoEdit extends StatefulWidget {
  const PersonalInfoEdit({super.key});

  @override
  State<PersonalInfoEdit> createState() => _PersonalInfoEditState();
}

bool clicked = false;
String? val;

class _PersonalInfoEditState extends State<PersonalInfoEdit>
    with BasePage<PersonalInfoEditVM> {
  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     provider.personalProfileController =
  //         TextEditingController(text: provider.variantModel?.personalProfile);
  //   });
  // }

  // @override
  // void dispose() {
  //   provider.personalProfileController.dispose();
  //   super.dispose();
  // }

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
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/common/back.png'),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  margin:
                                      const EdgeInsets.fromLTRB(30, 5, 30, 40),
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffC99253),
                                      border: Border.all(
                                          color: const Color(0xff866035),
                                          width: 6),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.0, 10.0, 8.0, 0.0),
                                            child: Text(
                                              'Personal Information',
                                              style: TextStyle(
                                                  color: Color(0xffFBFFB0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 3,
                                          indent: 10,
                                          endIndent: 10,
                                          color: Color(0xff78867D),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'Chin Name :',
                                                  style: TextStyle(
                                                      color: Color(0xffFBFFB0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0),
                                                ),
                                              ),
                                              Text(
                                                "${provider.variantModel?.chineseName}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'Eng Name :',
                                                  style: TextStyle(
                                                      color: Color(0xffFBFFB0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0),
                                                ),
                                              ),
                                              Text(
                                                "${provider.variantModel?.englishName}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'Class :',
                                                  style: TextStyle(
                                                      color: Color(0xffFBFFB0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0),
                                                ),
                                              ),
                                              Text(
                                                "${provider.variantModel?.className}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'Class No :',
                                                  style: TextStyle(
                                                      color: Color(0xffFBFFB0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0),
                                                ),
                                              ),
                                              Text(
                                                "${provider.variantModel?.classNo}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 3,
                                          indent: 10,
                                          endIndent: 10,
                                          color: Color(0xff78867D),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8.0, 10.0, 8.0, 0.0),
                                                child: Text(
                                                  'Personal Profile',
                                                  style: TextStyle(
                                                      color: Color(0xffFBFFB0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      clicked = true;
                                                    });
                                                    //_editTitleTextField();
                                                    // print("clicked");
                                                  },
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: Image.asset(
                                                        'assets/common/edit.png'),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 3,
                                          indent: 10,
                                          endIndent: 10,
                                          color: Color(0xff78867D),
                                        ),
                                        _editTitleTextField(),
                                        const Divider(
                                          thickness: 3,
                                          indent: 10,
                                          endIndent: 10,
                                          color: Color(0xff78867D),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Visibility(
                                              visible: clicked,
                                              child: Container(
                                                  height: 50,
                                                  width: 90,
                                                  child: Button1(
                                                      buttonText: 'Cancel',
                                                      buttonAction: () {
                                                        clicked = false;
                                                        Navigator.pop(context);
                                                      })),
                                            ),
                                            Visibility(
                                              visible: clicked,
                                              child: Container(
                                                  height: 50,
                                                  width: 91,
                                                  child: Button1(
                                                      buttonText: 'save',
                                                      buttonAction: () {
                                                        setState(() {
                                                          clicked = false;
                                                          provider
                                                              .updatePersonalProfile(
                                                                  context);
                                                        });
                                                      })),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  ))
                ]))
          ]),
        )));
  }

  Widget _editTitleTextField() {
    if (clicked) {
      return Container(
        padding: const EdgeInsets.all(8),
        height: 120,
        // color: Colors.white,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: TextField(
          maxLines: 100,
          decoration: const InputDecoration(border: InputBorder.none),
          style: const TextStyle(color: Color(0xff010049), fontSize: 18),
          onSubmitted: (val) {
            setState(() {
              //clicked = false;
              personalProfileController.text = val;
            });
          },
          autofocus: true,
          controller: personalProfileController,
        ),
      );
    }
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Text(
          "${provider.variantModel?.personalProfile}",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
    );
  }

  @override
  PersonalInfoEditVM create() => PersonalInfoEditVM();

  @override
  void initialise(BuildContext context) {}
}
