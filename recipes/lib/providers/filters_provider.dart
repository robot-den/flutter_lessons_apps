import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/models/models.dart';
import 'package:recipes/repository/recipe/recipes.dart';

class FiltersNotifier extends StateNotifier<Filters> {
  FiltersNotifier() : super(Filters());

  void setFilter(Filter filter, bool value) {
    final repo = GetIt.I<AbstractRecipesRepository>();
    final filters = Filters.fromFilters(repo.filters()); // duplicate object

    switch (filter) {
      case Filter.glutenFree:
        filters.onlyGlutenFree = value;
      case Filter.lactoseFree:
        filters.onlyLactoseFree = value;
      case Filter.vegan:
        filters.onlyVegan = value;
      case Filter.vegetarian:
        filters.onlyVegetarian = value;
      default:
        throw ('unhadled filter');
    }

    repo.updateFilters(filters);

    state = filters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Filters>((ref) {
  return FiltersNotifier();
});
