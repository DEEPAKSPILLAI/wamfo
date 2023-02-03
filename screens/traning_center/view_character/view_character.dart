import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/components/profile/profile.dart';
import 'package:wamfo/screens/traning_center/view_character/character_info/character_info.dart';
import 'package:wamfo/screens/traning_center/view_character/view_character_vm.dart';

class ViewCharacter extends StatefulWidget {
  const ViewCharacter({super.key});

  @override
  State<ViewCharacter> createState() => _ViewCharacterState();
}

class _ViewCharacterState extends State<ViewCharacter>
    with BasePage<ViewCharacterVM> {
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
                                      "Your character",
                                      style: TextStyle(
                                        color: Color(0xff874438),
                                        fontSize: 24,
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Normal: (4/5)",
                                        style: TextStyle(
                                          color: Color(0xff874438),
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 95,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CharacterInfo(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              height: 85,
                                              width: 85,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                color: Colors.grey[300],
                                                border: Border.all(
                                                  style: BorderStyle.solid,
                                                  width: 8,
                                                  color:
                                                      const Color(0xffDDCDB8),
                                                ),
                                              ),
                                              child: Image.asset(
                                                'assets/characters/c1.png',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Rare: (1/4)",
                                        style: TextStyle(
                                          color: Color(0xff874438),
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 95,
                                      child: ListView.builder(
                                        itemCount: 1,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CharacterInfo(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              height: 85,
                                              width: 85,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                color: Colors.grey[300],
                                                border: Border.all(
                                                  style: BorderStyle.solid,
                                                  width: 8,
                                                  color:
                                                      const Color(0xffDDCDB8),
                                                ),
                                              ),
                                              child: Image.asset(
                                                'assets/characters/c3.png',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Super Rare: (0/3)",
                                        style: TextStyle(
                                          color: Color(0xff874438),
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: ListView.builder(
                                        itemCount: 0,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CharacterInfo(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              height: 85,
                                              width: 85,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                color: Colors.grey[300],
                                                border: Border.all(
                                                  style: BorderStyle.solid,
                                                  width: 8,
                                                  color:
                                                      const Color(0xffDDCDB8),
                                                ),
                                              ),
                                              child: Image.asset(
                                                'assets/characters/c3.png',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Epic: (1/2)",
                                        style: TextStyle(
                                          color: Color(0xff874438),
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 95,
                                      child: ListView.builder(
                                        itemCount: 1,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CharacterInfo(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              height: 85,
                                              width: 85,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                color: Colors.grey[300],
                                                border: Border.all(
                                                  style: BorderStyle.solid,
                                                  width: 8,
                                                  color:
                                                      const Color(0xffDDCDB8),
                                                ),
                                              ),
                                              child: Image.asset(
                                                'assets/characters/c11.png',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
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
  ViewCharacterVM create() => ViewCharacterVM();

  @override
  void initialise(BuildContext context) {}
}
