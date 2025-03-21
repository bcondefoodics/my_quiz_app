import 'package:flutter/material.dart';
import 'package:my_quiz_app/answer_button.dart';
import 'package:my_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswer});

  final void Function(String answer) onAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void selectAnswer(String answer) {
    widget.onAnswer(answer);

    currentQuestionIndex++;
  }

  Widget columnQuestionWidget() {
    List<Widget> questionWidgets = [];

    var currentQuestion = questions[currentQuestionIndex];

    var shuffeldAnswers = currentQuestion.answers..shuffle();

    shuffeldAnswers.forEach((answer) {
      questionWidgets.add(
        AnswerButton(text: answer, onPressed: () => selectAnswer(answer)),
      );
    });

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: questionWidgets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
          columnQuestionWidget(),
        ],
      ),
    );
  }
}
