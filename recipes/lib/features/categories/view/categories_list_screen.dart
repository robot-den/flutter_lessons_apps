import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:recipes/features/categories/widgets/widgets.dart';
import 'package:recipes/repository/category/abstract_categories_repository.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesRepository = GetIt.I<AbstractCategoriesRepository>();
    final categories = categoriesRepository.categories();

    return GridView(
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
          )
      ],
    );
  }
}
