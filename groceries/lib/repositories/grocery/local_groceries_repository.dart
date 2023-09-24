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
  List<Grocery> localGroceries() {
    return List.of(_localGroceries);
  }

  @override
  void setLocalGroceries(List<Grocery> groceries) {
    _localGroceries = groceries;
  }

  @override
  void saveLocalGrocery(Grocery grocery, int? index) {
    if (index == null) {
      _localGroceries.add(grocery);
    } else {
      _localGroceries.insert(index, grocery);
    }
  }

  @override
  void deleteLocalGrocery(Grocery grocery) {
    _localGroceries.remove(grocery);
  }

  @override
  Future<List<Grocery>> groceries() async {
    final response = await dio.get(
      '$dbUrl/groceries.json',
      options: Options(
        headers: {
          'Content-Type': Headers.jsonContentType,
        },
      ),
    );

    if (response.statusCode != 200) {
      throw ('Groceries loading failed with code: ${response.statusCode}');
    }

    final List<Grocery> groceriesList = [];
    if (response.data == null) {
      return groceriesList;
    }

    for (final entry in response.data.entries) {
      final value = entry.value as Map<String, dynamic>;
      final category =
          categories().firstWhere((cat) => cat.name == value['category']);
      groceriesList.add(
        Grocery(
          id: entry.key,
          name: value['name'],
          quantity: value['quantity'],
          category: category,
        ),
      );
    }

    return groceriesList;
  }

  @override
  Future<void> saveGrocery(Grocery grocery) async {
    final response = await dio.post(
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

    if (response.statusCode == 200) {
      if (response.data['name'] != null) {
        grocery.id = response.data['name'];
        _localGroceries.add(grocery);
      }
    }
  }

  @override
  Future<bool> deleteGrocery(Grocery grocery) async {
    _localGroceries.remove(grocery);

    try {
      final response = await dio.delete('$dbUrl/groceries/${grocery.id}.json');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
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

List<Grocery> _localGroceries = [];
