import 'package:groceries/models/models.dart';

abstract class AbstractGroceriesRepository {
  List<Grocery> groceries();
  List<Category> categories();
  void saveGrocery(Grocery grocery);
  void deleteGrocery(Grocery grocery);
}
