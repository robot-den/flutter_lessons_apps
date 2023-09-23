import 'package:groceries/models/models.dart';
import 'package:groceries/repositories/grocery/abstract_groceries_repository.dart';

class LocalGroceriesRepository implements AbstractGroceriesRepository {
  @override
  List<Grocery> groceries() {
    return List.of(_groceries);
  }

  @override
  void saveGrocery(Grocery grocery) {
    _groceries.add(grocery);
  }

  @override
  void deleteGrocery(Grocery grocery) {
    _groceries.remove(grocery);
  }

  @override
  List<Category> categories() {
    return freezedListOfCategories.values.toList();
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
  final category = freezedListOfCategories[cat];

  return category ?? otherCategory;
}
