import 'package:quiz/models/models.dart';
import 'package:quiz/repositories/questions/abstract_questions_repository.dart';

class LocalQuestionsRepository implements AbstractQuestionsRepository {
  @override
  Future<List<Question>> getQuestions() {
    return Future.value(questions);
  }
}

final List<Question> questions = [
  Question(
    text: 'Какой город является самым населенным в мире?',
    answers: [
      Answer(text: 'Шанхай', id: 0),
      Answer(text: 'Токио', id: 1, correct: true),
      Answer(text: 'Дели', id: 2),
      Answer(text: 'Москва', id: 3)
    ],
  ),
  Question(
    text: 'Какой город считается самым высокогорной столицей мира?',
    answers: [
      Answer(text: 'Ла Пас', id: 0, correct: true),
      Answer(text: 'Кито', id: 1),
      Answer(text: 'Катманду', id: 2),
      Answer(text: 'Осло', id: 3)
    ],
  ),
  Question(
    text: 'В какой стране находится город Каир?',
    answers: [
      Answer(text: 'Египет', id: 0, correct: true),
      Answer(text: 'Тунис', id: 1),
      Answer(text: 'Марокко', id: 2),
      Answer(text: 'Иран', id: 3)
    ],
  ),
  Question(
    text: 'Какой город является самым большим по площади в мире?',
    answers: [
      Answer(text: 'Хуанитос', id: 0),
      Answer(text: 'Токио', id: 1, correct: true),
      Answer(text: 'Москва', id: 2),
      Answer(text: 'Лос-Анджелес', id: 3)
    ],
  ),
  Question(
    text: 'Какой город является столицей Южной Кореи?',
    answers: [
      Answer(text: 'Сеул', id: 0, correct: true),
      Answer(text: 'Пусан', id: 1),
      Answer(text: 'Инчхон', id: 2),
      Answer(text: 'Дэгу', id: 3)
    ],
  ),
  Question(
    text: 'В каком городе находится Большая Китайская стена?',
    answers: [
      Answer(text: 'Пекин', id: 0, correct: true),
      Answer(text: 'Шанхай', id: 1),
      Answer(text: 'Хонгконг', id: 2),
      Answer(text: 'Куньмин', id: 3)
    ],
  ),
  Question(
    text: 'Какой город является самым посещаемым туристическим местом в мире?',
    answers: [
      Answer(text: 'Бангкок', id: 0),
      Answer(text: 'Париж', id: 1),
      Answer(text: 'Лондон', id: 2, correct: true),
      Answer(text: 'Дубай', id: 3)
    ],
  ),
  Question(
    text: 'Какой город считается столицей кулинарного искусства?',
    answers: [
      Answer(text: 'Лион', id: 0, correct: true),
      Answer(text: 'Токио', id: 1),
      Answer(text: 'Рим', id: 2),
      Answer(text: 'Мехико', id: 3)
    ],
  ),
  Question(
    text: 'Какая страна является местом рождения пиццы?',
    answers: [
      Answer(text: 'Италия', id: 0, correct: true),
      Answer(text: 'Греция', id: 1),
      Answer(text: 'Турция', id: 2),
      Answer(text: 'Франция', id: 3)
    ],
  ),
  Question(
    text: 'В каком городе находится Версальский дворец?',
    answers: [
      Answer(text: 'Париж', id: 0),
      Answer(text: 'Марсель', id: 1),
      Answer(text: 'Лион', id: 2),
      Answer(text: 'Версаль', id: 3, correct: true)
    ],
  )
];
