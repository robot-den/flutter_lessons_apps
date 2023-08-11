import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/features/results/widgets/formatted_results.dart';
import 'package:quiz/models/models.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.navigateTo,
    required this.questions,
  });

  final List<Question> questions;
  final void Function(String path) navigateTo;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    final int correctAnswersCount = widget.questions
        .where((question) => question.selectedAnswer().correct)
        .length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Correct answers: $correctAnswersCount / ${widget.questions.length}',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            FormattedResults(questions: widget.questions),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                widget.navigateTo('/');
              },
              icon: const Icon(Icons.replay_circle_filled_outlined),
              label: const Text('Try again'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(width: 0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
