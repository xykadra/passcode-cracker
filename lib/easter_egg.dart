import 'package:flutter/material.dart';

class EasterEggPage extends StatelessWidget {
  const EasterEggPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
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
                ],
              ),
              Spacer(),
              Text("VOLIM TE KRTICE MALA", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
              Container(
                height: 400,
                child: Image.asset("lib/assets/krtica.JPG"),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
