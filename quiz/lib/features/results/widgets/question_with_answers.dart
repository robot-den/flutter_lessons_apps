import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/models/models.dart';

class QuestionWithAnswers extends StatelessWidget {
  const QuestionWithAnswers({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.text,
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            question.selectedAnswer().text,
            style: GoogleFonts.roboto(fontSize: 15),
          ),
          const SizedBox(height: 2),
          Text(
            question.correctAnswer().text,
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(255, 133, 230, 197),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
