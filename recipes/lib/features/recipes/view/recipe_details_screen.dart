import 'package:flutter/material.dart';
import 'package:recipes/models/models.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(recipe.imageUrl),
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Text(
              'Ingridients',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            for (final ingredient in recipe.ingredients)
              Text(
                '${ingredient.name}, ${ingredient.amountStr}',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              'Steps',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            for (final step in recipe.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  step,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
