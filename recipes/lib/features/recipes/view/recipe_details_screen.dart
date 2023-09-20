import 'package:flutter/material.dart';
import 'package:recipes/models/models.dart';
import 'package:recipes/providers/favorite_recipes_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailsScreen extends ConsumerWidget {
  const RecipeDetailsScreen({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    ref.watch(favoriteRecipesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoriteRecipesProvider.notifier)
                  .toggleRecipeIsFavorite(recipe);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(recipe.isFavorite
                      ? 'Recipe is added to favorites'
                      : 'Recipe is removed from favorites'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: Tween(begin: 0.0, end: 1.0).animate(animation),
                    curve: Curves.decelerate,
                  ),
                  child: child,
                );
              },
              child: Icon(
                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                key: ValueKey(recipe.isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: recipe.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(recipe.imageUrl),
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
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
