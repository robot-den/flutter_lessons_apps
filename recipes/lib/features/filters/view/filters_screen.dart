import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/repository/recipe/recipes.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final filters = GetIt.I<AbstractRecipesRepository>().filters();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onBackground,
    );
    final subtitleStyle = theme.textTheme.labelMedium!.copyWith(
      color: theme.colorScheme.onBackground,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filters.onlyGlutenFree,
            onChanged: (isChecked) {
              setState(() {
                filters.onlyGlutenFree = isChecked;
              });
            },
            title: Text('Gluten-free', style: titleStyle),
            subtitle: Text('show only gluten-free meals', style: subtitleStyle),
            activeColor: theme.colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 44, right: 22),
          ),
          SwitchListTile(
            value: filters.onlyLactoseFree,
            onChanged: (isChecked) {
              setState(() {
                filters.onlyLactoseFree = isChecked;
              });
            },
            title: Text('Lactose-free', style: titleStyle),
            subtitle:
                Text('show only lactose-free meals', style: subtitleStyle),
            activeColor: theme.colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 44, right: 22),
          ),
          SwitchListTile(
            value: filters.onlyVegan,
            onChanged: (isChecked) {
              setState(() {
                filters.onlyVegan = isChecked;
              });
            },
            title: Text('Vegan', style: titleStyle),
            subtitle: Text('show only vegan meals', style: subtitleStyle),
            activeColor: theme.colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 44, right: 22),
          ),
          SwitchListTile(
            value: filters.onlyVegetarian,
            onChanged: (isChecked) {
              setState(() {
                filters.onlyVegetarian = isChecked;
              });
            },
            title: Text('Vegetarian', style: titleStyle),
            subtitle: Text('show only vegetarian meals', style: subtitleStyle),
            activeColor: theme.colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 44, right: 22),
          ),
        ],
      ),
    );
  }
}
