import 'package:quiz/models/answer.dart';

class Question {
  Question({
    required this.text,
    required this.answers,
  });

  final String text;
  final List<Answer> answers;
  int? selectedAnswerIndex;

  Answer selectedAnswer() {
    if (selectedAnswerIndex == null) {
      throw ('selectedAnswerIndex is not set');
    }

    return answers[selectedAnswerIndex!];
  }

  Answer correctAnswer() {
    return answers.firstWhere(
      (answer) => answer.correct,
      orElse: () => throw ('unable to find correct answer'),
    );
  }

  // IMPORTANT: copy original list to escape mutation
  List<Answer> shuffledAnswers() {
    final List<Answer> shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
