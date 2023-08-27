import 'package:flutter/material.dart';
import 'package:recipes/models/models.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      splashColor: theme.primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(8), // NOTE: must match with InkWell
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 9, 181, 15).withOpacity(0.55),
              const Color.fromARGB(255, 216, 26, 26).withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          recipe.title,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
