import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/models/models.dart';
import 'package:recipes/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);

    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onBackground,
    );
    final subtitleStyle = theme.textTheme.labelMedium!.copyWith(
      color: theme.colorScheme.onBackground,
    );

    final notifier = ref.read(filtersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filters.onlyGlutenFree,
            onChanged: (isChecked) =>
                notifier.setFilter(Filter.glutenFree, isChecked),
            title: Text('Gluten-free', style: titleStyle),
            subtitle: Text('show only gluten-free meals', style: subtitleStyle),
            activeColor: theme.colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 44, right: 22),
          ),
          SwitchListTile(
            value: filters.onlyLactoseFree,
            onChanged: (isChecked) =>
                notifier.setFilter(Filter.lactoseFree, isChecked),
            title: Text('Lactose-free', style: titleStyle),
            subtitle:
                Text('show only lactose-free meals', style: subtitleStyle),
            activeColor: theme.colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 44, right: 22),
          ),
          SwitchListTile(
            value: filters.onlyVegan,
            onChanged: (isChecked) =>
                notifier.setFilter(Filter.vegan, isChecked),
            title: Text('Vegan', style: titleStyle),
            subtitle: Text('show only vegan meals', style: subtitleStyle),
            activeColor: theme.colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 44, right: 22),
          ),
          SwitchListTile(
            value: filters.onlyVegetarian,
            onChanged: (isChecked) =>
                notifier.setFilter(Filter.vegetarian, isChecked),
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
