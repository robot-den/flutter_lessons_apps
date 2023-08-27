import 'package:flutter/material.dart';
import 'package:recipes/features/recipes/widgets/widgets.dart';
import 'package:recipes/models/models.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({
    super.key,
    required this.recipes,
    required this.category,
  });

  final Category category;
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget body;

    if (recipes.isNotEmpty) {
      body = ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RecipeListItem(recipe: recipes[index]),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick recipe'),
      ),
      body: body,
    );
  }
}
