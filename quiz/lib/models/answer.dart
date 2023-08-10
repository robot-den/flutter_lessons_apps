class Answer {
  Answer({
    required this.text,
    required this.id,
    this.correct = false,
  });

  final String text;
  final int id;
  final bool correct;
}
