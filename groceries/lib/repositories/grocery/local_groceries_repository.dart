import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:groceries/models/models.dart';
import 'package:groceries/repositories/grocery/abstract_groceries_repository.dart';
import 'package:groceries/secrets.dart';

class LocalGroceriesRepository implements AbstractGroceriesRepository {
  LocalGroceriesRepository({required this.dio});

  final Dio dio;
  final dbUrl = 'https://$PROJECT_ID.europe-west1.firebasedatabase.app';

  @override
  List<Grocery> groceries() {
    return [];
  }

  @override
  void saveGrocery(Grocery grocery) {
    final response = dio.post(
      '$dbUrl/groceries.json',
      data: json.encode({
        'name': grocery.name,
        'quantity': grocery.quantity,
        'category': grocery.category.name,
      }),
      options: Options(
        headers: {
          'Content-Type': Headers.jsonContentType,
        },
      ),
    );
    // _groceries.add(grocery);
  }

  @override
  void deleteGrocery(Grocery grocery) {
    // TODO: implement;
  }

  @override
  List<Category> categories() {
    return freezedListOfCategories.values.toList();
  }
}

Category category(Categories cat) {
  final category = freezedListOfCategories[cat];

  return category ?? otherCategory;
}
