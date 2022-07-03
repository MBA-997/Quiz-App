import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionsIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 7},
        {'text': 'Blue', 'score': 5},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 2},
        {'text': 'Cheetah', 'score': 4},
        {'text': 'Siberian Leopard', 'score': 0},
        {'text': 'Koala Bear', 'score': 0}
      ]
    },
    {
      'questionText': 'What\'s your favorite personality?',
      'answers': [
        {'text': 'Gary Vee', 'score': 1},
        {'text': 'Steve Jobs', 'score': 2},
        {'text': 'Bill Gates', 'score': 5},
        {'text': 'Elon Musk', 'score': 0}
      ]
    }
  ];

  void _answerQuestion(int score) {
    this._totalScore += score;
    setState(() {
      _questionsIndex += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionsIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('My First Flutter App')),
      body: _questionsIndex < _questions.length
          ? Center(
              child: Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionsIndex: _questionsIndex,
              ),
            )
          : Result(_totalScore, resetQuiz),
    ));
  }
}
