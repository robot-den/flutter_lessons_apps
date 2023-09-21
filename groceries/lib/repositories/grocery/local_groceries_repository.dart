import 'package:flutter/material.dart';
import 'package:groceries/models/models.dart';
import 'package:groceries/repositories/grocery/abstract_groceries_repository.dart';

class LocalGroceriesRepository implements AbstractGroceriesRepository {
  @override
  List<Grocery> groceries() {
    return List.of(_groceries);
  }
}

final _groceries = [
  Grocery(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: category(Categories.dairy),
  ),
  Grocery(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: category(Categories.fruit),
  ),
  Grocery(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: category(Categories.meat),
  ),
];

Category category(Categories cat) {
  final category = _categories[cat];

  return category ?? _restCategory;
}

final _restCategory = Category(name: 'Rest', color: Colors.white);
final _categories = {
  Categories.vegetables: Category(
      name: 'Vegetables', color: const Color.fromARGB(255, 0, 255, 128)),
  Categories.fruit:
      Category(name: 'Fruit', color: const Color.fromARGB(255, 145, 255, 0)),
  Categories.meat:
      Category(name: 'Meat', color: const Color.fromARGB(255, 255, 102, 0)),
  Categories.dairy:
      Category(name: 'Dairy', color: const Color.fromARGB(255, 0, 208, 255)),
};
