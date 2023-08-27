import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/recipes_app.dart';
import 'package:recipes/repository/category/category.dart';
import 'package:recipes/repository/recipe/recipes.dart';

void main() {
  GetIt.I.registerSingleton<AbstractCategoriesRepository>(
    LocalCategoriesRepository(),
  );

  GetIt.I.registerSingleton<AbstractRecipesRepository>(
    LocalRecipesRepository(),
  );

  runApp(const RecipesApp());
}
