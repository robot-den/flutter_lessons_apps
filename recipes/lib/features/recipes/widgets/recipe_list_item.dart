import 'package:flutter/material.dart';
import 'package:recipes/features/recipes/widgets/recipe_trait.dart';
import 'package:recipes/models/models.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem({
    super.key,
    required this.recipe,
    required this.onSelectRecipe,
  });

  final Recipe recipe;

  final void Function(BuildContext context, Recipe recipe) onSelectRecipe;

  String capitalize(String text) {
    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }

  String get complexityText => capitalize(recipe.complexity.name);
  String get affordabilityText => capitalize(recipe.affordability.name);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => onSelectRecipe(context, recipe),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(recipe.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Text(
                      recipe.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        RecipeTrait(
                          icon: Icons.schedule,
                          label: '${recipe.duration} min.',
                        ),
                        const Spacer(),
                        RecipeTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const Spacer(),
                        RecipeTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
