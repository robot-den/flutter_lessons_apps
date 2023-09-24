import 'package:groceries/models/models.dart';

abstract class AbstractGroceriesRepository {
  List<Category> categories();

  Future<List<Grocery>> groceries();
  Future<void> saveGrocery(Grocery grocery);
  Future<bool> deleteGrocery(Grocery grocery);

  List<Grocery> localGroceries();
  void setLocalGroceries(List<Grocery> groceries);
  void saveLocalGrocery(Grocery grocery, int? index);
  void deleteLocalGrocery(Grocery grocery);
}
