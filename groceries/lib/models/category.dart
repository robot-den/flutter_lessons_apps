import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

class Category {
  Category({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}

final freezedListOfCategories = {
  Categories.vegetables: Category(
      name: 'Vegetables', color: const Color.fromARGB(255, 0, 255, 128)),
  Categories.fruit:
      Category(name: 'Fruit', color: const Color.fromARGB(255, 145, 255, 0)),
  Categories.meat:
      Category(name: 'Meat', color: const Color.fromARGB(255, 255, 102, 0)),
  Categories.dairy:
      Category(name: 'Dairy', color: const Color.fromARGB(255, 0, 208, 255)),
  Categories.carbs:
      Category(name: 'Carbs', color: const Color.fromARGB(255, 0, 60, 255)),
  Categories.sweets:
      Category(name: 'Sweets', color: const Color.fromARGB(255, 255, 149, 0)),
  Categories.spices:
      Category(name: 'Spices', color: const Color.fromARGB(255, 255, 187, 0)),
  Categories.convenience: Category(
      name: 'Convenience', color: const Color.fromARGB(255, 191, 0, 255)),
  Categories.hygiene:
      Category(name: 'Hygiene', color: const Color.fromARGB(255, 149, 0, 255)),
  Categories.other:
      Category(name: 'Other', color: const Color.fromARGB(255, 0, 255, 255)),
};

final otherCategory = freezedListOfCategories[Categories.other]!;
