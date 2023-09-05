import 'package:flutter/material.dart';
import 'package:recipes/features/recipes/view/recipe_details_screen.dart';
import 'package:recipes/features/recipes/widgets/widgets.dart';
import 'package:recipes/models/models.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({
    super.key,
    required this.recipes,
    this.categoryName,
    required this.onToggleFavorite,
  });

  final String? categoryName;
  final List<Recipe> recipes;
  final void Function(Recipe recipe) onToggleFavorite;

  void navigateToRecipeDetailed(BuildContext context, Recipe recipe) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return RecipeDetailsScreen(
            recipe: recipe,
            onToggleFavorite: onToggleFavorite,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget body;

    if (recipes.isNotEmpty) {
      body = ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeListItem(
            recipe: recipes[index],
            onSelectRecipe: navigateToRecipeDetailed,
          );
        },
      );
    } else {
      final textColor = theme.colorScheme.onBackground;

      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No recipes here :(',
              style: theme.textTheme.headlineSmall!.copyWith(color: textColor),
            ),
            const SizedBox(height: 8),
            Text(
              'Try another category!',
              style: theme.textTheme.bodyLarge!.copyWith(color: textColor),
            ),
          ],
        ),
      );
    }

    if (categoryName == null) {
      return body;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName recipes'),
      ),
      body: body,
    );
  }
}
