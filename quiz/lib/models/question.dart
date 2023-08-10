import 'package:quiz/models/answer.dart';

class Question {
  Question({
    required this.text,
    required this.answers,
  });

  final String text;
  final List<Answer> answers;

  // IMPORTANT: copy original list to escape mutation
  List<Answer> shuffledAnswers() {
    final List<Answer> shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
