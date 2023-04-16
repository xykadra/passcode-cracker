import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:passcode_cracker/pages/game_page.dart';

class GameOverPage extends StatelessWidget {
  final List<int> randomNumbers;

  GameOverPage({
    required this.randomNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            height: 350,
            width: 300,
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                Text(
                  "GAME OVER",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 40),
                ),
                Lottie.asset("lib/assets/game_over.json", height: 150),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context, builder: (context) => AlertDialog(
                          icon: Icon(Icons.error),
                          title: Text("Numbers"),
                          content: Text(randomNumbers.toString(), style: GoogleFonts.interTight(color: Colors.red, fontSize: 32),),


                        ));
                  },
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red),
                    child: Center(
                      child: Text(
                        "See numbers",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GamePage(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.yellow),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Play again",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.loop)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
