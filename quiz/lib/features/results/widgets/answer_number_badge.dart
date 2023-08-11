import 'package:flutter/material.dart';
import 'package:quiz/models/models.dart';

class AnsweNumberBadge extends StatelessWidget {
  const AnsweNumberBadge({
    super.key,
    required this.i,
    required this.question,
  });

  final int i;
  final Question question;

  @override
  Widget build(BuildContext context) {
    final color = question.selectedAnswer().correct
        ? const Color.fromARGB(255, 133, 230, 197)
        : const Color.fromARGB(255, 230, 133, 133);

    return Container(
      alignment: Alignment.topCenter,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1),
        color: color,
      ),
      child: Center(
        child: Text('${i + 1}'),
      ),
    );
  }
}
