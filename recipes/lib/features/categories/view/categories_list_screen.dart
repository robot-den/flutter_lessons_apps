import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:recipes/features/categories/widgets/widgets.dart';
import 'package:recipes/repository/category/abstract_categories_repository.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      // lowerBound: 0,
      // upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesRepository = GetIt.I<AbstractCategoriesRepository>();
    final categories = categoriesRepository.categories();

    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in categories)
              CategoryGridItem(category: category)
          ],
        ),
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOutExpo,
            )),
            child: child,
          );
        });
  }
}
