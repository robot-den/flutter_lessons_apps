import 'package:flutter/material.dart';
import 'package:quiz/features/results/widgets/answer_number_badge.dart';
import 'package:quiz/features/results/widgets/question_with_answers.dart';
import 'package:quiz/models/models.dart';

class FormattedResults extends StatelessWidget {
  const FormattedResults({super.key, required this.questions});

  final List<Question> questions;

  List<Widget> indexedRows() {
    List<Widget> rows = [];

    for (var i = 0; i < questions.length; i++) {
      Question question = questions[i];

      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnsweNumberBadge(i: i, question: question),
            const SizedBox(width: 10),
            QuestionWithAnswers(question: question)
          ],
        ),
      );
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: indexedRows(),
        ),
      ),
    );
  }
}
