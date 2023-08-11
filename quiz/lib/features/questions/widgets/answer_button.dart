import 'package:flutter/material.dart';
import 'package:quiz/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answer,
    required this.onPressed,
  });

  final Answer answer;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size.fromHeight(30),
      ),
      onPressed: onPressed,
      child: Text(
        answer.text,
        style: GoogleFonts.roboto(),
      ),
    );
  }
}
