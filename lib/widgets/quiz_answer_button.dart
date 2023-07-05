import 'package:flutter/material.dart';

class quizAnswerButton extends StatelessWidget {
  final String buttonLabels;
  final VoidCallback onTap;
  const quizAnswerButton(
      {super.key, required this.buttonLabels, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                child: Text(
                  buttonLabels,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                onPressed: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
