import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_quiz_app/data/questions.dart';
import 'package:my_quiz_app/question_summary.dart';
import 'package:my_quiz_app/models/question_summary_item.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });

  final Function() onRestart;
  final List<String> selectedAnswers;

  List<QuestionSummaryItem> getQuestionSummaryItems() {
    final List<QuestionSummaryItem> questionSummaryItems = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      questionSummaryItems.add(
        QuestionSummaryItem(
          question: questions[i].question,
          userAnswer: selectedAnswers[i],
          currentAnswer: questions[i].answers[questions[i].answerIndex],
        ),
      );
    }
    return questionSummaryItems;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswers =
        questions.where((question) {
          final index = questions.indexOf(question);
          return question.answers[question.answerIndex] ==
              selectedAnswers[index];
        }).length;

    final totalQuestions = questions.length;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have completed the quiz!',
            style: GoogleFonts.robotoFlex(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Text(
            'You answered $correctAnswers out of $totalQuestions questions correctly',
          ),
          const SizedBox(height: 30),
          QuestionSummary(questionSummaryItems: getQuestionSummaryItems()),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: onRestart,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
