import 'package:flutter/material.dart';
import 'package:quiz/data/quiz_data.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.answers});
  final List<String> answers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < answers.length; i++) {
      summary.add({
        'index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': answers[i],
      });
    }

    return summary;
  }

  @override
  build(context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You answered x of y questions correctly"),
            const SizedBox(
              height: 30,
            ),
            const Text("FUTURE RESULTS"),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Restart Quiz"),
            ),
          ],
        ));
  }
}
