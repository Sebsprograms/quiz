import 'package:flutter/material.dart';
import 'package:quiz/components/question_screen.dart';
import 'package:quiz/start_screen.dart';

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

  @override
  Widget build(context) {
    Widget screen = activeScreen == 'start-screen'
        ? StartScreen(changeScreen)
        : const QuestionsScreen();
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
