import 'package:groceries/models/category.dart';

class Grocery {
  Grocery({
    this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  String? id;
  final String name;
  final int quantity;
  final Category category;
}
