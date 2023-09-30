import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intermediate_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.item, {super.key});

  final Map<String, Object> item;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = item['user_answer'] == item['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: item['question_index'] as int,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['question'] as String,
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                item['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromRGBO(212, 212, 212, 0.90),
                ),
              ),
              Text(
                item['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromRGBO(199, 253, 255, 0.898),
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
