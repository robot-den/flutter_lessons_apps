import 'package:recipes/models/models.dart';

abstract class AbstractRecipesRepository {
  List<Recipe> recipes() => [];
  List<Recipe> filteredRecipes({
    Category? category,
    bool? isFavorite,
    Filters? filters,
  }) {
    return [];
  }

  Recipe updateRecipe(Recipe recipe);
  Filters filters();
  Filters updateFilters(Filters filters);
}
