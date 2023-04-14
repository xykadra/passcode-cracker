import "dart:math";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  void addBodyElements() {
    bodyElements.add(Container(
      height: 50,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'data',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ));
  }

  List<Widget> bodyElements = [];
  String randomNumbers() {
    int num1 = Random().nextInt(10);
    int num2 = Random().nextInt(10);
    int num3 = Random().nextInt(10);
    int num4 = Random().nextInt(10);

    return num1.toString() +
        num2.toString() +
        num3.toString() +
        num4.toString();
  }

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController num3Controller = TextEditingController();
  final TextEditingController num4Controller = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepPurple,
          body: Padding(
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
                    Text(
                      "Random number: " + randomNumbers(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
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
                      setState(() {});
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Try",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
               // Spacer(flex: 20,),
                // ListView(
                //   children: <Widget>[
                //     Column(
                //       children: bodyElements,
                //     ),
                //   ],
                // ),
                
                Spacer(),
              ],
            ),
          )),
    );
  }
}
