import "dart:math";

import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:passcode_cracker/pages/game_over_page.dart';
import "package:passcode_cracker/pages/win_page.dart";
import "package:passcode_cracker/util/utilForAdditionalWidget.dart";
import "package:passcode_cracker/welcome_page.dart";

import '../easter_egg.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //Lists
  List<int> inputNumbers = [];

  List<Widget> bodyElements = [];
  List<int> numbers = [];
  List<int> randomNumbers = [];

  //color of text "CORRECT/NUMBERS/SPOTS"
  Color colorOfText = Colors.white;
  int counterForWidgets = 0;
  int counterForTries = 9;

  void initState() {
    super.initState();
    randomNumbers = _generateRandomNumbers();
  }

  void _chekForWin(int correctNumbers, int correctSpots) {
    if (correctNumbers == 4 && correctSpots == 4) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WinPage(),
          ));
    }
  }

  void addBodyElements(String num1, String num2, String num3, String num4,
      int correctNumbers, int correctSpots, int counterForWidgets) {
    counterForWidgets < 9
        ? bodyElements.add(UtilForAdditionalWidgets(
            num1: num1,
            num2: num2,
            num3: num3,
            num4: num4,
            correctNumbers: correctNumbers,
            correctSpots: correctSpots))
        : _navigateToGameOverPage(randomNumbers);
  }

  void _navigateToGameOverPage(List<int> randomNumbers) {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameOverPage(
              randomNumbers: randomNumbers,
            ),
          ));
    });
  }
  //Functions that returns list of 4 random numbers

  List<int> _generateRandomNumbers() {
    Random random = Random();
    List<int> numbers = [];

    while (numbers.length < 4) {
      int num = random.nextInt(9) + 1;
      if (!numbers.contains(num)) {
        numbers.add(num);
      }
    }
    return numbers;
  }

  void _generateNewRandomNumbers() {
    setState(() {
      randomNumbers = _generateRandomNumbers();
    });
  }

  //controllers for input fields
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController num3Controller = TextEditingController();
  final TextEditingController num4Controller = TextEditingController();

  Map<int, int> checkNumbers(List<int> inputNumbers, List<int> randomNumbers) {
    int correctNumbers = 0;
    int correctSpots = 0;

    for (int i = 0; i < inputNumbers.length; i++) {
      if (randomNumbers.contains(inputNumbers[i])) {
        correctNumbers++;
      }

      if (inputNumbers[i] == randomNumbers[i]) {
        correctSpots++;
      }
    }

    return {correctNumbers: correctSpots};
  }

  Map<int, int> result = Map.from({1: 0, 2: 0});

  void checkInput() {
    result = checkNumbers(inputNumbers, randomNumbers);
  }

  void _checkForSpotSound(int rightSpots) {
    if (rightSpots > 0) {
      //play sound

      setState(() {
        AudioPlayer().play(AssetSource("right_spot.mp3"), volume: 50);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "I understood",
                                      style: GoogleFonts.sourceCodePro(
                                          color: Colors.white, fontSize: 25),
                                    )),
                                  ),
                                ),
                                Text("Dev. Mirza Kadrić v1.0.0. 2023")
                              ],
                              icon: Icon(Icons.error),
                              title: Text("How to play PASSCODE CRACKER?"),
                              content: Column(
                                children: [
                                  Text(
                                    "In the input fields enter numbers in range 1 to 9, and try to crack code!",
                                    style: GoogleFonts.sourceCodePro(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Game will give you hint how many numbers you did right and how many of them are in right spot.",
                                    style: GoogleFonts.sourceCodePro(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Divider(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "RULES",
                                    style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "1. DO NOT ENTER TWO SAME NUMBERS (Exception still not handled (too much work))",
                                    style: GoogleFonts.inter(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "2. DO NOT ENTER ZERO",
                                      style: GoogleFonts.interTight(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "3. DO NOT PRESS TRY WITHOUT INPUTING SOME NUMBERS",
                                      style: GoogleFonts.interTight(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  },
                  child: Container(
                    color: Colors.grey[200],
                    height: 30,
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      "Tries remaining: " + counterForTries.toString(),
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colorOfText = Colors.white;
                      bodyElements.clear();
                      _generateNewRandomNumbers();
                      num1Controller.text = "";
                      num2Controller.text = "";
                      num3Controller.text = "";
                      num4Controller.text = "";
                      inputNumbers.clear();
                      counterForTries = 9;
                    });
                  },
                  child: Container(
                    color: Colors.red,
                    height: 30,
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[900],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 210.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Text("CORRECT",
                        style: GoogleFonts.inter(
                            color: colorOfText, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("     NUMBER",
                            style: GoogleFonts.inter(color: colorOfText)),
                        Text("SPOTS      ",
                            style: GoogleFonts.inter(color: colorOfText)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: bodyElements,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Input of numbers
                  Container(
                    //color: Colors.grey[200],
                    height: 40,
                    width: MediaQuery.of(context).size.width / 6,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: num1Controller,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black)),
                        counterText: "",
                      ),
                    ),
                  ),

                  Container(
                    //color: Colors.white,
                    height: 40,
                    width: MediaQuery.of(context).size.width / 6,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: num2Controller,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black)),
                        counterText: "",
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.deepPurple,
                    height: 40,
                    width: MediaQuery.of(context).size.width / 6,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: num3Controller,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black)),
                        counterText: "",
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.deepPurple,
                    height: 40,
                    width: MediaQuery.of(context).size.width / 6,
                    child: TextFormField(
                      //textInputAction: TextInputAction.next,
                      controller: num4Controller,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black)),
                        counterText: "",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    //counter for widgets
                    counterForWidgets++;
                    counterForTries--;

                    //making visiable correct numbers and correct spots
                    colorOfText = Colors.black;
                    //clearing list input numbers and then adding new numbers to it
                    inputNumbers.clear();
                    inputNumbers.add(int.parse(num1Controller.text));
                    inputNumbers.add(int.parse(num2Controller.text));
                    inputNumbers.add(int.parse(num3Controller.text));
                    inputNumbers.add(int.parse(num4Controller.text));
                    //function that checks input and returing correct numbers and correct spots
                    checkInput();
                    _checkForSpotSound(result.values.first);
                    //adding widgets
                    addBodyElements(
                      num1Controller.text,
                      num2Controller.text,
                      num3Controller.text,
                      num4Controller.text,
                      result.keys.first,
                      result.values.first,
                      counterForWidgets,
                    );
                    _chekForWin(result.keys.first, result.values.first);

                    //making forms clear
                    num1Controller.text = "";
                    num2Controller.text = "";
                    num3Controller.text = "";
                    num4Controller.text = "";
                  });
                },
                onDoubleTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EasterEggPage(),
                      ));
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Try",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "Random number: " + randomNumbers.toString(),
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold),
            // ),
            // Text(counterForWidgets.toString()),
          ],
        ),
      )),
    ));
  }
}
