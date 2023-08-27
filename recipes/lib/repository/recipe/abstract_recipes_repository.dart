import 'package:recipes/models/models.dart';

abstract class AbstractRecipesRepository {
  List<Recipe> recipes() => [];
  List<Recipe> filteredRecipes({Category? category}) => [];
}
