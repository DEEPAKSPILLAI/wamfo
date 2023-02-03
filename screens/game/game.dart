import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import 'package:wamfo/base/base_page.dart';
import 'package:wamfo/screens/game/game_vm.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with BasePage<GameVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(provider.bgList[provider.bgIndex]),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.57,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [Container()],
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    fit: StackFit.loose,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/game/heart.svg',
                                        width: 134,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            37.5, 5.9, 0, 5),
                                        width: ((provider.character.hp /
                                                provider.character.totalHP) *
                                            100),
                                        height: 27,
                                        decoration: const BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            )),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '100/${((provider.character.hp / provider.character.totalHP) * 100).toInt()}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Stack(
                                    fit: StackFit.loose,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/game/heartMonster.svg',
                                        width: 134,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(
                                                0, 5.9, 38.7, 5),
                                            width: ((provider.monster.hp /
                                                    provider.monster.totalHP) *
                                                100),
                                            height: 25,
                                            decoration: const BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(16),
                                                topLeft: Radius.circular(16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${((provider.monster.hp / provider.monster.totalHP) * 100).toInt()}/100',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    fit: StackFit.loose,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/game/energy.svg',
                                        width: 134,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            38.5, 5.9, 0, 5),
                                        width: ((provider.character.energy /
                                                provider
                                                    .character.totalEnergy) *
                                            100),
                                        height: 25,
                                        decoration: const BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            )),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '100/${((provider.character.energy / provider.character.totalEnergy) * 100).toInt()}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Stack(
                                    fit: StackFit.loose,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/game/energyMonster.svg',
                                        width: 134,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 5.9, 38.7, 5),
                                        width: ((provider.monster.energy /
                                                provider.monster.totalEnergy) *
                                            100),
                                        height: 25,
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16),
                                            topLeft: Radius.circular(16),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${((provider.monster.energy / provider.monster.totalEnergy) * 100).toInt()}/100',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 180,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          left: (MediaQuery.of(context).size.width / 4) *
                              provider.character.currentPosition,
                          child: SizedBox(
                            width: 100,
                            height: 200,
                            child: Image.asset(
                              provider.character.avather!,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Positioned(
                          right: (MediaQuery.of(context).size.width / 4) *
                              provider.monster.currentPosition,
                          child: SizedBox(
                            width: 100,
                            height: 180,
                            child: Image.asset(
                              provider.monster.avather!,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: provider.aaa==false,
                child: Positioned(
                    bottom: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              button(
                                () {
                                  provider.challenge();
                                },
                                "assets/game/challenge.svg",
                                "Challenge",
                                "(-10 energy)",
                              ),
                              button(
                                () {
                                  // provider.moveRight();
                                  provider.kick();
                                },
                                "assets/game/kick.svg",
                                "Kick",
                                "(-10 energy)",
                              ),
                              button(
                                () {
                                  provider.moveForward();
                                },
                                "assets/game/moveForward.svg",
                                "Move",
                                "forward",
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              button(
                                () {
                                  // provider.moveRight();
                                  provider.magic();
                                },
                                "assets/game/magic.svg",
                                "Magic",
                                "(-30 energy)",
                              ),
                              button(
                                () {
                                  // provider.moveRight();
                                },
                                "assets/game/rest.svg",
                                "Rest",
                                "(+20 energy)",
                              ),
                              button(
                                () {
                                  provider.moveBackward();
                                },
                                "assets/game/moveBackword.svg",
                                "Move",
                                "backword",
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(15.0),
                        child: Image.asset('assets/common/gear.png'),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget button(fn, String image, String text, String text2) {
    return InkWell(
      onTap: fn,
      child: Column(
        children: [
          SvgPicture.asset(image),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            text2,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  GameVM create() => GameVM();
  @override
  void initialise(BuildContext context) {}
}
