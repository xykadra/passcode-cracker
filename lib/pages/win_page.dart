import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'game_page.dart';

class WinPage extends StatelessWidget {
  final List<int> randomNumbers;

  WinPage({
    required this.randomNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "YOU WON!!!",
              style: GoogleFonts.sourceCodePro(
                  fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "YESS, YOUR NUMBERS WERE",
                      style: GoogleFonts.inter(fontSize: 25),
                    ),
                    Text(
                      randomNumbers
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                          .replaceAll(',', ""),
                      style: GoogleFonts.inter(
                          fontSize: 32, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Lottie.asset(
              "lib/assets/win.json",
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GamePage(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Play again",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.loop,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total wins today: SOON",
                  style: GoogleFonts.sourceCodePro(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Best time: SOON",
                  style: GoogleFonts.sourceCodePro(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
