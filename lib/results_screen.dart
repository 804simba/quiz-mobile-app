import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var index = 0; index < chosenAnswers.length; index++) {
      summary.add({
        'question_index': index,
        'question': questions[index].text,
        'correct_answer': questions[index].answers[0],
        'user_answer': chosenAnswers[index],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numberTotalQuestions = questions.length;
    final numberOfCorrectQuestions = summaryData.where((data) => data['user_answer'] == data['correct_answer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numberOfCorrectQuestions out of $numberTotalQuestions answers correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
