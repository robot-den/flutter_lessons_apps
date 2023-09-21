import 'package:flutter/material.dart';

import 'package:groceries/features/groceries/view/groceries_list_screen.dart';
import 'package:groceries/theme/theme.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const GroceriesListScreen(),
    );
  }
}
