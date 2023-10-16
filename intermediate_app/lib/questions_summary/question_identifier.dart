import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return CircleAvatar(
      backgroundColor: isCorrectAnswer
          ? const Color.fromRGBO(51, 215, 105, 0.815)
          : const Color.fromRGBO(229, 55, 43, 0.792),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
