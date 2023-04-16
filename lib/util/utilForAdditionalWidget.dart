import 'package:flutter/material.dart';

class UtilForAdditionalWidgets extends StatelessWidget {
  final String num1;
  final String num2;
  final String num3;
  final String num4;

  final int correctNumbers;
  final int correctSpots;

  UtilForAdditionalWidgets({
    required this.num1,
    required this.num2,
    required this.num3,
    required this.num4,
    required this.correctNumbers,
    required this.correctSpots,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 25,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(2),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  num1 + num2 + num3 + num4,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(flex: 3,),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  correctNumbers.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Spacer(flex: 3,),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  correctSpots.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
