import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton(
    {
      required this.answerText,
      required this.onTap,
      super.key
    }
  );

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return
    ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 40,
      ),
      backgroundColor: const Color.fromARGB(255, 37, 9, 92),
      foregroundColor: const Color.fromARGB(255, 253, 247, 255)
    ),
    child: Text(answerText,
    textAlign: TextAlign.center,
    ),
    );
  }
}