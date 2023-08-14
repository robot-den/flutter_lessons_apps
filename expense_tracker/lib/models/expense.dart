import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.createdAt,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime createdAt;
}
