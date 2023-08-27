import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/features/categories/widgets/widgets.dart';
import 'package:recipes/features/recipes/view/recipes_list_screen.dart';
import 'package:recipes/models/models.dart';
import 'package:recipes/repository/category/abstract_categories_repository.dart';
import 'package:recipes/repository/recipe/recipes.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  void navigateToCategoryRecipes(BuildContext context, Category category) {
    final recipes = GetIt.I<AbstractRecipesRepository>()
        .filteredRecipes(category: category);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return RecipesListScreen(category: category, recipes: recipes);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoriesRepository = GetIt.I<AbstractCategoriesRepository>();
    final categories = categoriesRepository.categories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in categories)
            CategoryGridItem(
              category: category,
              onSelectCategory: navigateToCategoryRecipes,
            )
        ],
      ),
    );
  }
}
