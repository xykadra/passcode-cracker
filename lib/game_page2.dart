//import 'dart:html';
import 'dart:math';
//import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passcode_cracker/easter_egg.dart';

class GamePage2 extends StatefulWidget {
  const GamePage2({super.key});

  @override
  State<GamePage2> createState() => _GamePage2State();
}

class _GamePage2State extends State<GamePage2> {
  //color of text "CORRECT/NUMBERS/SPOTS"
  Color colorOfText = Colors.deepPurple;

  void addBodyElements(String num1, String num2, String num3, String num4,
      int correctNumbers, int correctSpots) {
    bodyElements.add(Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 150,
            //color: Colors.black,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  num1 + num2 + num3 + num4,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  correctNumbers.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  correctSpots.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  List<Widget> bodyElements = [];

  List<int> numbers = [];
  List<int> randomNumbers = [];
  void initState() {
    super.initState();
    randomNumbers = _generateRandomNumbers();
  }

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

  //randomNumbers.toString I have random numbers stored
  //for example randomNumbers[0].toStrins

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController num3Controller = TextEditingController();
  final TextEditingController num4Controller = TextEditingController();

  //numers added to list
  List<int> inputNumbers = [];

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

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.deepPurple,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Text(
                //   "Random number: " + randomNumbers.toString(),
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),

            Padding(
                padding: const EdgeInsets.only(left: 210.0, right: 5),
                child: Column(
                  children: [
                    Text("CORRECT",
                        style: GoogleFonts.inter(color: colorOfText)),
                    Row(
                      children: [
                        Text("numbers",
                            style: GoogleFonts.inter(color: colorOfText)),
                        Spacer(),
                        Text("spots",
                            style: GoogleFonts.inter(color: colorOfText)),
                      ],
                    ),
                  ],
                )),
            Column(
              children: bodyElements,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Input of numbers
                Container(
                  color: Colors.deepPurple,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 6,
                  child: TextFormField(
                    controller: num1Controller,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(counterText: ""),
                  ),
                ),
                Container(
                  color: Colors.deepPurple,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 6,
                  child: TextFormField(
                    controller: num2Controller,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(counterText: ""),
                  ),
                ),
                Container(
                  color: Colors.deepPurple,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 6,
                  child: TextFormField(
                    controller: num3Controller,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(counterText: ""),
                  ),
                ),
                Container(
                  color: Colors.deepPurple,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 6,
                  child: TextFormField(
                    controller: num4Controller,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(counterText: ""),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    colorOfText = Colors.white;
                    inputNumbers.clear();
                    inputNumbers.add(int.parse(num1Controller.text));
                    inputNumbers.add(int.parse(num2Controller.text));
                    inputNumbers.add(int.parse(num3Controller.text));
                    inputNumbers.add(int.parse(num4Controller.text));
                    checkInput();
                    addBodyElements(
                        num1Controller.text,
                        num2Controller.text,
                        num3Controller.text,
                        num4Controller.text,
                        result.keys.first,
                        result.values.first);
                    num1Controller.text = "";
                    num2Controller.text = "";
                    num3Controller.text = "";
                    num4Controller.text = "";
                  });
                },
                onDoubleTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EasterEggPage(),));
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Tryy",
                      style: TextStyle(
                          color: Colors.black,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    colorOfText = Colors.deepPurple;
                    bodyElements.clear();
                    _generateNewRandomNumbers();
                    num1Controller.text = "";
                    num2Controller.text = "";
                    num3Controller.text = "";
                    num4Controller.text = "";
                    inputNumbers.clear();
                  });
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Restart",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
