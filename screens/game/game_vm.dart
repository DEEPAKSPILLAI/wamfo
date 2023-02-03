import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wamfo/base/base_view_model.dart';
import 'package:wamfo/main.dart';
import 'dart:math' as math;
import 'package:wamfo/models/character_model.dart';

import '../../components/input/custom_button.dart';

class GameVM extends BaseViewModel {
  @override
  void onInit() {}
  bool aaa = false;
  List<String> bgList = [
    "assets/game/bg1.png",
    "assets/game/bg2.png",
    "assets/game/bg3.png",
    "assets/game/bg4.png",
    "assets/game/bg5.png"
  ];
  int bgIndex = math.Random().nextInt(5);
  Character character = Character(
      characterId: "c1",
      attackDamage: 10,
      attackEnergy: 10,
      characterName: "ch 1",
      energy: 100,
      hp: 100,
      totalHP: 100,
      totalEnergy: 100,
      kickDamage: 20,
      kickEnergy: 10,
      magicDamage: 30,
      magicEnergy: 30);

  Character monster = Character(
      characterId: "c2",
      attackDamage: 10,
      attackEnergy: 10,
      characterName: "m1",
      energy: 100,
      hp: 100,
      totalEnergy: 100,
      totalHP: 100,
      kickDamage: 20,
      kickEnergy: 10,
      magicDamage: 30,
      magicEnergy: 30);

  moveForward() {
    if (character.currentPosition < 2) {
      character.currentPosition = character.currentPosition + 1;
    }
    notifyListeners();
    aiMove();
  }

  moveBackward() {
    if (character.currentPosition > 0) {
      character.currentPosition = character.currentPosition - 1;
    }
    notifyListeners();
    aiMove();
  }

  challenge() {
    if (character.energy >= 10) {
      character.energy = character.energy - 10;
      if (monster.currentPosition + character.currentPosition == 2) {
        monster.hp = monster.hp - 10;
      }
    } else {
      showNotification("You dont have energy");
    }
    notifyListeners();
    checkWin();
  }

  kick() {
    if (character.energy >= character.kickEnergy) {
      character.energy = character.energy - character.kickEnergy;
      if (monster.currentPosition + character.currentPosition == 2) {
        monster.hp = monster.hp - character.kickDamage;
      }
    } else {
      showNotification("You dont have energy");
    }
    notifyListeners();
    checkWin();
    checkfail();
  }

  magic() {
    if (character.energy >= character.magicEnergy) {
      character.energy = character.energy - character.magicEnergy;
      // if (monster.currentPosition + character.currentPosition == 2) {
      monster.hp = monster.hp - character.magicDamage;
      // }
    } else {
      showNotification("You dont have energy");
    }
    notifyListeners();
    checkWin();
    checkfail();
  }

  checkWin() {
    if (monster.hp <= 0) {
      // showNotification("YOU WIN");
      showDialog(
        context: MyApp.context,
        builder: (context) {
          aaa = true;
          return Dialog(
            child: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "YOU WIN",
                      style: TextStyle(fontSize: 26),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            child: Stack(children: [
                              SvgPicture.asset(
                                'assets/common/button.svg',
                                fit: BoxFit.fill,
                              ),
                              Center(child: Text("Quit",style: TextStyle(color: Colors.white),))
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            child: Stack(children: [
                              SvgPicture.asset(
                                'assets/common/button.svg',
                                fit: BoxFit.fill,
                              ),
                              Center(child: Text("Reset",style: TextStyle(color: Colors.white),))
                            ]),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        },
      );
    }
  }

  checkfail() {
    if (character.hp <= 0) {
      // showNotification("YOU WIN");
      showDialog(
        context: MyApp.context,
        builder: (context) {
          aaa = true;
          return Dialog(
            child: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                          "YOU FAIL",
                          style: TextStyle(fontSize: 26),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            child: Stack(children: [
                              SvgPicture.asset(
                                'assets/common/button.svg',
                                fit: BoxFit.fill,
                              ),
                              Center(child: Text("Quit",style: TextStyle(color: Colors.white),))
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            child: Stack(children: [
                              SvgPicture.asset(
                                'assets/common/button.svg',
                                fit: BoxFit.fill,
                              ),
                              Center(child: Text("Reset",style: TextStyle(color: Colors.white),))
                            ]),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        },
      );
    }
  }

  aiMove() {
    if (monster.currentPosition + character.currentPosition == 2) {
      characterIsNear();
    }
  }

  // case 1//
  //kick//
  characterIsNear() {
    monster.energy = monster.energy - monster.kickEnergy;
    character.hp = character.hp - monster.kickDamage;
    notifyListeners();
    checkWin();
    checkfail();
  }
}
