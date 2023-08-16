import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
const categoryToIcon = {
  Category.food: Icons.fastfood,
  Category.gym: Icons.sports_soccer,
  Category.home: Icons.home,
  Category.car: Icons.car_rental,
};
final dateFormatter = DateFormat.yMd();

enum Category { food, gym, home, car }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.createdAt,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime createdAt;
  final Category category;

  IconData get icon => categoryToIcon[category] ?? Icons.question_mark;
  String get formattedCreatedAt => dateFormatter.format(createdAt);
  String get formattedAmount => amount.toStringAsFixed(2);
}
