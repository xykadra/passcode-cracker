import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'game_page.dart';

class WinPage extends StatelessWidget {
  const WinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "YOU WON",
            style: GoogleFonts.sourceCodePro(
                fontSize: 40, fontWeight: FontWeight.bold),
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
                    borderRadius: BorderRadius.circular(0), color: Colors.blue),
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
    );
  }
}
