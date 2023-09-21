import 'package:flutter/material.dart';

enum Categories {
  rest,
  vegetables,
  fruit,
  meat,
  dairy,
}

class Category {
  Category({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}
