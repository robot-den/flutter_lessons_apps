import 'package:flutter/material.dart';
import 'package:quiz/features/questions/widgets/answer_button.dart';
import 'package:quiz/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.navigateTo,
    required this.questions,
  });

  final List<Question> questions;
  final void Function(String path) navigateTo;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void onAnswerPressed(Question question, int answerId) {
    question.selectedAnswerIndex = answerId;

    if (currentQuestionIndex + 1 < widget.questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      widget.navigateTo('/results');
    }
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.roboto(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.shuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answer: answer,
                  onPressed: () {
                    onAnswerPressed(currentQuestion, answer.id);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
