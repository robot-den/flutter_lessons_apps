import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/features/categories/view/categories_list_screen.dart';
import 'package:recipes/features/recipes/view/recipes_list_screen.dart';
import 'package:recipes/models/models.dart';
import 'package:recipes/repository/recipe/recipes.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: const Duration(seconds: 2), content: Text(message)),
    );
  }

  void _toggleRecipeIsFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
      GetIt.I<AbstractRecipesRepository>().updateRecipe(recipe);
    });

    if (recipe.isFavorite) {
      _showInfoMessage('recipe added to favorite');
    } else {
      _showInfoMessage('recipe is removed from favorite');
    }
  }

  Widget get currentScreen {
    switch (_selectedScreenIndex) {
      case 0:
        return CategoriesListScreen(
          onToggleFavorite: _toggleRecipeIsFavorite,
        );
      case 1:
        final recipes = GetIt.I<AbstractRecipesRepository>()
            .filteredRecipes(isFavorite: true);
        return RecipesListScreen(
          recipes: recipes,
          onToggleFavorite: _toggleRecipeIsFavorite,
        );
      default:
        throw ('unhandled tab id');
    }
  }

  String get currentTitleText {
    switch (_selectedScreenIndex) {
      case 0:
        return 'Pick category';
      case 1:
        return 'Favorite recipes';
      default:
        throw ('unhandled tab id');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitleText),
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}
