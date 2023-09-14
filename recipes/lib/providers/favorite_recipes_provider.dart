import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/models/models.dart';
import 'package:recipes/repository/recipe/recipes.dart';

class FavoriteRecipesNotifier extends StateNotifier<List<Recipe>> {
  FavoriteRecipesNotifier() : super([]);

  void toggleRecipeIsFavorite(Recipe recipe) {
    final repo = GetIt.I<AbstractRecipesRepository>();
    recipe.isFavorite = !recipe.isFavorite;
    repo.updateRecipe(recipe);

    state = repo.filteredRecipes(isFavorite: true);
  }
}

final favoriteRecipesProvider =
    StateNotifierProvider<FavoriteRecipesNotifier, List<Recipe>>((ref) {
  return FavoriteRecipesNotifier();
});
