import 'package:flutter/material.dart';
import 'package:my_quiz_app/question_screen.dart';
import 'package:my_quiz_app/data/questions.dart';
import 'package:my_quiz_app/results_screen.dart';

import 'intro_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'intro';
  final List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results';
      });
    } else {
      setState(() {
        activeScreen = 'question';
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'question';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = IntroScreen(switchScreen);

    if (activeScreen == 'results') {
      screenWidget = ResultsScreen(
        selectedAnswers: selectedAnswers,
        onRestart: restart,
      );
    }

    if (activeScreen == 'question') {
      screenWidget = QuestionScreen(onAnswer: addAnswer);
    }

    return MaterialApp(
      title: 'My Quiz App',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.red],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
