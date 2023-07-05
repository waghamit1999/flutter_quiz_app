import 'package:flutter/material.dart';

class ScoreTrackerIcon extends StatelessWidget {
  final List<bool> userAnswersList;
  const ScoreTrackerIcon({super.key, required this.userAnswersList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: userAnswersList
          .map((isCorrectAnswer) => isCorrectAnswer
              ? Icon(Icons.check, color: Colors.green)
              : Icon(Icons.close, color: Colors.red))
          .toList(),
    );
  }
}
