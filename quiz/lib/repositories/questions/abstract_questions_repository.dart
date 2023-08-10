import 'package:quiz/models/question.dart';

abstract class AbstractQuestionsRepository {
  Future<List<Question>> getQuestions();
}
