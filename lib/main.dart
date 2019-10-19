import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < 2) {
        _questionIndex = _questionIndex + 1;
      }
      else {
        _questionIndex = 0;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Blue', 'Red', 'Green', 'Black']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Cat', 'Dog', 'Lizards', 'Not Fish']
      },
      {
        'questionText': 'What\'s your favorite season?',
        'answers': ['Spring', 'Summer', 'Fall', 'Winter']
      }

    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz App"),),
        body: Column(children: [
          Question(
            questions[_questionIndex]['questionText'],
          ),
          ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
        ),
      ),
    );
  }
}