import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipes/features/categories/view/categories_list_screen.dart';
import 'package:recipes/features/filters/view/filters_screen.dart';
import 'package:recipes/features/recipes/view/recipes_list_screen.dart';
import 'package:recipes/features/tab_navigation/widgets/side_drawer.dart';
import 'package:recipes/providers/favorite_recipes_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void navigateToRoute(String route) {
    Navigator.of(context).pop();

    switch (route) {
      case 'categories':
        setState(() {
          _selectedScreenIndex = 0;
        });
      case 'filters':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const FiltersScreen(),
          ),
        );
      default:
        throw ('unhandled route: $route');
    }
  }

  Widget get currentScreen {
    switch (_selectedScreenIndex) {
      case 0:
        return const CategoriesListScreen();
      case 1:
        final recipes = ref.watch(favoriteRecipesProvider);
        return RecipesListScreen(recipes: recipes);
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
      drawer: SideDrawer(
        onSelectRoute: navigateToRoute,
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
