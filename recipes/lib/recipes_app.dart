import 'package:flutter/material.dart';
import 'package:recipes/features/categories/view/categories_list_screen.dart';
import 'package:recipes/theme/theme.dart';

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CategoriesListScreen(),
    );
  }
}
