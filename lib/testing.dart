import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.red),
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
              SizedBox(height: 15,),
              Container(
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
            ],
          ),
        ),
      )),
    );
  }
}
