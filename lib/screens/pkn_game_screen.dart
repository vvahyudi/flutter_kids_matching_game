import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sasix/utilities/utilities.dart';
import 'package:provider/provider.dart';
import '../models/game_items.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/settings_provider.dart';

class PknGameScreen extends StatefulWidget {
  const PknGameScreen({Key? key}) : super(key: key);

  @override
  State<PknGameScreen> createState() => _PknGameScreenState();
}

class _PknGameScreenState extends State<PknGameScreen> {
  //to keep track of the player's score and game status

  // here new score
  late int score;
  late bool gameOver;
  late Utilities utilities = Utilities();

  late List<GameItem> choiceAll;
  late List<GameItem> choiceA;
  late List<GameItem> choiceB;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    initGame();
    super.didChangeDependencies();
  }

  void initGame() {
    final localization = AppLocalizations.of(context)!;
    score = 0;
    gameOver = false;

    choiceAll = [
      //1.1
      GameItem(
          image: "assets/images/pkn/Pancasila.png",
          name: localization.pancasila,
          value: localization.pancasila,
          level: "Level 1"),
      //1.2
      GameItem(
          image: "assets/images/pkn/SumpahPemuda.png",
          name: localization.sumpahPemuda,
          value: localization.sumpahPemuda,
          level: "Level 1"),
      //1.3
      GameItem(
          image: "assets/images/pkn/Pancasila.png",
          name: localization.pancasila,
          value: localization.pancasila,
          level: "Level 1"),
      // //1.4
      // GameItem(
      //     image: "assets/images/pkn/Pancasila.png",
      //     name: localization!.pancasila,
      //     value: localization.pancasila,
      //     level: "Level 1"),
      // //1.5
      // GameItem(
      //     image: "assets/images/pkn/Pancasila.png",
      //     name: localization!.pancasila,
      //     value: localization.pancasila,
      //     level: "Level 1"),
      // // 1.6
      // GameItem(
      //     image: "assets/images/pkn/Pancasila.png",
      //     name: localization!.pancasila,
      //     value: localization.pancasila,
      //     level: "Level 1"),

      // // 1.7
      // GameItem(
      //     image: "assets/images/pkn/Pancasila.png",
      //     name: localization!.pancasila,
      //     value: localization.pancasila,
      //     level: "Level 1"),

      // // 1.8
      // GameItem(
      //     image: "assets/images/pkn/Pancasila.png",
      //     name: localization!.pancasila,
      //     value: localization.pancasila,
      //     level: "Level 1"),

      // // 1.9
      // GameItem(
      //     image: "assets/images/pkn/Pancasila.png",
      //     name: localization!.pancasila,
      //     value: localization.pancasila,
      //     level: "Level 1"),

      // // 1.10
      // GameItem(
      //     image: "assets/images/pkn/Pancasila.png",
      //     name: localization!.pancasila,
      //     value: localization.pancasila,
      //     level: "Level 1"),
    ];
    choiceA = List<GameItem>.from(choiceAll.where((element) =>
        element.level.contains(utilities.getGameLevel().toString())));
    choiceB = List<GameItem>.from(choiceAll.where((element) =>
        element.level.contains(utilities.getGameLevel().toString())));
    choiceA.shuffle();
    choiceB.shuffle();
  }

  final _audioController = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);

    if (choiceA.isEmpty) {
      gameOver = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${AppLocalizations.of(context)!.score} :  $score',
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          initGame();
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (!gameOver)
                  Row(
                    children: <Widget>[
                      Column(
                        children: choiceA.map((choice) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            child: Draggable<GameItem>(
                              data: choice,
                              feedback: Text(
                                choice.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                              childWhenDragging: Container(
                                padding: const EdgeInsets.all(12),
                                height: 80,
                                width: 150,
                                child: Text(
                                  choice.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                height: 80,
                                width: 150,
                                child: Text(
                                  choice.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const Spacer(),
                      Column(
                        children: choiceB.map((choice) {
                          return DragTarget<GameItem>(
                              onAccept: (receivedItem) async {
                            if (receivedItem.value == choice.value) {
                              await _audioController.play(
                                  AssetSource('sounds/success_bell2.mp3'));

                              // if (!mounted) return;
                              setState(() {
                                choiceA.remove(receivedItem);
                                choiceB.remove(choice);
                                score += 10;
                                choice.accepting = false;
                              });
                            } else {
                              setState(() {
                                score -= 5;
                                choice.accepting = false;
                              });
                            }
                          }, onLeave: (receivedItem) {
                            setState(() {
                              choice.accepting = false;
                            });
                          }, onWillAccept: (receivedItem) {
                            setState(() {
                              choice.accepting = true;
                            });
                            return true;
                          }, builder: (context, acceptedItem, rejectedItem) {
                            return Container(
                              color: choice.accepting
                                  ? provider.themeColor as Color
                                  : Colors.white,
                              height: 80,
                              width: 105,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(8),
                              child: Image.asset(choice.image),
                            );
                          });
                        }).toList(),
                      )
                    ],
                  ),
                if (gameOver)
                  Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        "$score/100",
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text(
                        AppLocalizations.of(context)!.gameOver,
                        style: TextStyle(
                            color: score >= 50 ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Center(
                        child: ElevatedButton(
                          child: Text(
                            AppLocalizations.of(context)!.tryAgain,
                            // style: TextStyle(
                            //   fontSize: 30,
                            // ),
                          ),
                          onPressed: () {
                            initGame();
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if ((score >= 50) && utilities.getGameLevel() <= 4)
                        Center(
                          child: ElevatedButton(
                            child: Text(
                              AppLocalizations.of(context)!.nextGame,
                              // style: TextStyle(
                              //   fontSize: 30,
                              // ),
                            ),
                            onPressed: () {
                              utilities.nextGameLevel();
                              initGame();
                              setState(() {});
                            },
                          ),
                        )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
