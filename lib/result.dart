import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    var resultText = 'you did it';
    if (resultScore <= 8) {
      resultText = 'you are an okay person';
    } else if (resultScore <= 12) {
      resultText = 'you are not strange';
    } else if (resultScore <= 18) {
      resultText = 'you are naughty';
    } else {
      resultText = 'get the fuck out of my kitchen';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}