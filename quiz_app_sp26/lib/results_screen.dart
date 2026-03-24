import 'package:flutter/material.dart';
import 'package:quiz_app_sp26/data/questions.dart';
import 'package:quiz_app_sp26/question_summary.dart';
import 'package:quiz_app_sp26/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.restart});
  final void Function() restart;
  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];
    for(var i = 0; i< chosenAnswers.length;i++){
        summary.add({
          'question_index':i,
          'question':questions[i].question,
          'correct_answer':questions[i].answers[0],
          'user_answer':chosenAnswers[i]
    });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = getSummaryData().length;
    final numTotalCorrect = summaryData.where((data){
      return data['correct_answer'] == data['user_answer'];
    }
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: GoogleFonts.jetBrainsMono(
                color: const Color.fromARGB(255, 229, 227, 230),
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
              'You answered $numTotalCorrect out of $numTotalQuestions questions correctly'
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: restart,
              icon: const Icon(Icons.refresh),
              style: OutlinedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 238, 236, 237)),
              label: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}