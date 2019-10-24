import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 2},
        {'text': 'Red', 'score': 4},
        {'text': 'Green', 'score': 3},
        {'text': 'Black', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 9},
        {'text': 'Dog', 'score': 2},
        {'text': 'Lizards', 'score': 7},
        {'text': 'Not Fish', 'score': 1}
       ]
    },
    {
      'questionText': 'What\'s your favorite season?',
      'answers': [
        {'text': 'Spring', 'score': 2},
        {'text': 'Summer', 'score': 3},
        {'text': 'Fall', 'score': 2},
        {'text': 'Winter', 'score': 3}
      ]
    }

  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length) {
      print("We have more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz App"),),
        body: _questionIndex < _questions.length
            ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}