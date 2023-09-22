import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries/features/groceries/view/new_grocery_screen.dart';
import 'package:groceries/features/groceries/widgets/groceries_list.dart';

import 'package:groceries/repositories/grocery/groceries_repository.dart';
import 'package:groceries/models/models.dart';

class GroceriesListScreen extends StatelessWidget {
  const GroceriesListScreen({super.key});

  void _newGrocery(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewGroceryScreen(),
      ),
    );
  }

  Widget mainContent(List<Grocery> groceries) {
    if (groceries.isEmpty) {
      return const Center(
        child: Text("You don't have any expenses. Start adding some!"),
      );
    } else {
      return GroceriesList(groceries: groceries);
    }
  }

  @override
  Widget build(BuildContext context) {
    final groceries = GetIt.I<AbstractGroceriesRepository>().groceries();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries list'),
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: mainContent(groceries)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _newGrocery(context),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
