import 'package:flutter/material.dart';
import 'package:quiz/components/answer_button.dart';
import 'package:quiz/data/quiz_data.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;

  void nextQuestion() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Container(
      padding: EdgeInsets.all(40),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map(
                (answer) => AnswerButton(
                  answerText: answer,
                  onTap: nextQuestion,
                ),
              ),
        ],
      ),
    );
  }
}
