import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
    required this.onSelectRoute,
  });

  final void Function(String route) onSelectRoute;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Cooking up!',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: theme.colorScheme.onBackground,
            ),
            title: Text(
              'Categories',
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.onBackground,
                fontSize: 24,
              ),
            ),
            onTap: () => onSelectRoute('categories'),
          ),
          ListTile(
            leading: Icon(
              Icons.filter_alt,
              size: 26,
              color: theme.colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.onBackground,
                fontSize: 24,
              ),
            ),
            onTap: () => onSelectRoute('filters'),
          ),
        ],
      ),
    );
  }
}
