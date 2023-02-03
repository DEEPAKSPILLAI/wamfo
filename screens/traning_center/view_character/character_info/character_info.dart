import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/traning_center/view_character/character_info/character_info_vm.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({super.key});

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo>
    with BasePage<CharacterInfoVM> {
  
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/common/traning_center_bg.png'),
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
                          const Profile(),
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
                              margin: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF2E8D7),
                                  border: Border.all(
                                      color: const Color(0xffDDCDB8),
                                      width: 10),
                                  borderRadius: BorderRadius.circular(15)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Character Info",
                                      style: TextStyle(
                                        color: Color(0xff874438),
                                        fontSize: 24,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Image.asset(
                                            'assets/characters/c1.png',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Character Name",
                                                  style: TextStyle(
                                                    color: Color(0xff874438),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  "Lv: 0",
                                                  style: TextStyle(
                                                    color: Color(0xff874438),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  "HP: 100",
                                                  style: TextStyle(
                                                    color: Color(0xff874438),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/common/swad.svg'),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "10 ~ 16 ",
                                          style: TextStyle(
                                              color: Color(0xff874438),
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          "+ 0",
                                          style: TextStyle(
                                              color: Color(0xff279800),
                                              fontSize: 18),
                                        ),
                                        // const SizedBox(width: 10),
                                        const Spacer(),
                                        Image.asset('assets/common/sheeld.png'),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "10 ~ 16 ",
                                          style: TextStyle(
                                              color: Color(0xff874438),
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          "+ 0",
                                          style: TextStyle(
                                              color: Color(0xff279800),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: const [
                                        SizedBox(width: 10),
                                        Text(
                                          "Dodge: 1%",
                                          style: TextStyle(
                                              color: Color(0xff874438),
                                              fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(
                                          "Critical: 1% ",
                                          style: TextStyle(
                                              color: Color(0xff874438),
                                              fontSize: 18),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: const Color(0xffF2E8D7),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffDDCDB8),
                                                  width: 10),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: const Center(
                                            child: Text(
                                              "Equip Tool",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: const Color(0xffF2E8D7),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffDDCDB8),
                                                  width: 10),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: const Center(
                                            child: Text(
                                              "Equip Armor",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "This game does not promote violence.",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 32)
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CharacterInfoVM create() => CharacterInfoVM();
  @override
  void initialise(BuildContext context) {}
}
