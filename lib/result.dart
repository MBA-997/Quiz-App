import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;

    if (totalScore <= 8) {
      resultText = 'You are amazing and interesting';
    } else if (totalScore <= 12) {
      resultText = 'You are best in adventures and quiet likable';
    } else {
      resultText = 'You are curious and love to travel';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(onPressed: resetQuiz, child: Text('Restart Quiz'))
      ],
    );
  }
}
