import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/components/answer_button.dart';
import 'package:quiz/data/quiz_data.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;

  void nextQuestion(String answer) {
    setState(() {
      questionIndex++;
    });
    widget.onSelectAnswer(answer);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Container(
      padding: const EdgeInsets.all(40),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 255, 153, 245),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map(
                (answer) => AnswerButton(
                  answerText: answer,
                  onTap: () {
                    nextQuestion(answer);
                  },
                ),
              ),
        ],
      ),
    );
  }
}
