import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipes/models/models.dart';
import 'package:recipes/features/recipes/view/recipes_list_screen.dart';
import 'package:recipes/repository/recipe/recipes.dart';
import 'package:recipes/providers/filters_provider.dart';

class CategoryGridItem extends ConsumerWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;
  void navigateToCategoryRecipes(
    BuildContext context,
    Category category,
    Filters filters,
  ) {
    final recipes = GetIt.I<AbstractRecipesRepository>()
        .filteredRecipes(category: category, filters: filters);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return RecipesListScreen(
            categoryName: category.title,
            recipes: recipes,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => navigateToCategoryRecipes(context, category, filters),
      splashColor: theme.primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(8), // NOTE: must match with InkWell
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
