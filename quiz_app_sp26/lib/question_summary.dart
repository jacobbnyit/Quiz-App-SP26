import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget{
QuestionSummary({super.key, required this.summaryData});

final List<Map<String,Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map(
        (data){
          final bool correct = data['user_answer'] == data['correct_answer'];
          return Row(
            children: [
              Text(style:GoogleFonts.jetBrainsMono(
                color: correct ? const Color.fromARGB(255, 84, 228, 88): const Color.fromARGB(255, 216, 51, 65),
                fontSize: 24,
                fontWeight: FontWeight.bold
                ),((data['question_index'] as int)+ 1).toString()),
              Column(
                children: [
                  Text(              style:GoogleFonts.jetBrainsMono(
                color: correct ? const Color.fromARGB(255, 84, 228, 88): const Color.fromARGB(255, 216, 51, 65),
                fontSize: 16,
                fontWeight: FontWeight.normal
                ),data['question'] as String),
                  const SizedBox(height: 5,),
                  Text(              style:GoogleFonts.jetBrainsMono(
                color: correct ? const Color.fromARGB(255, 84, 228, 88): const Color.fromARGB(255, 216, 51, 65),
                fontSize: 16,
                fontWeight: FontWeight.normal
                ),data['user_answer'] as String),
                  Text(              style:GoogleFonts.jetBrainsMono(
                color: correct ? const Color.fromARGB(255, 84, 228, 88): const Color.fromARGB(255, 216, 51, 65),
                fontSize: 16,
                fontWeight: FontWeight.normal
                ),data['correct_answer'] as String),
                ],
              )
            ],
            );
        }
        ).toList(),
        );
  }
}