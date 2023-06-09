import 'package:flutter/material.dart';
import 'package:quiz/components/question_screen.dart';
import 'package:quiz/components/result_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/data/quiz_data.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  List<String> answers = [];
  void recordAnswer(String answer) {
    setState(() {
      answers.add(answer);
      if (questions.length == answers.length) {
        activeScreen = 'result-screen';
      }
    });
  }

  @override
  Widget build(context) {
    Widget screen = StartScreen(changeScreen);
    if (activeScreen == 'question-screen') {
      screen = QuestionsScreen(onSelectAnswer: recordAnswer);
    } else if (activeScreen == 'result-screen') {
      screen = ResultScreen(
        answers: answers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.deepPurple,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
