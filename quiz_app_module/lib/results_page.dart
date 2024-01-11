import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.switchToQuestionScreen,
      required this.selectedAnswers});
  final void Function() switchToQuestionScreen;
  final List<String> selectedAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      QuizQuestion currentQuestion = questions[i];
      summary.add({
        'question_index': i,
        'question': currentQuestion.question,
        'answer': currentQuestion.answer[0],
        'selected_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestion = questions.length;
    final correctAnswers = summaryData
        .where((data) => data['answer'] == data['selected_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalQuestion questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(152, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: switchToQuestionScreen,
              icon: const Icon(
                Icons.refresh,
                color: Colors.grey,
              ),
              label: Text(
                "Restart Quiz!",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
