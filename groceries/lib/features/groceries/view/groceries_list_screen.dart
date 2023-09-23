import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries/features/groceries/view/new_grocery_screen.dart';
import 'package:groceries/features/groceries/widgets/groceries_list.dart';

import 'package:groceries/repositories/grocery/groceries_repository.dart';
import 'package:groceries/models/models.dart';

class GroceriesListScreen extends StatefulWidget {
  const GroceriesListScreen({super.key});

  @override
  State<GroceriesListScreen> createState() => _GroceriesListScreenState();
}

class _GroceriesListScreenState extends State<GroceriesListScreen> {
  final repo = GetIt.I<AbstractGroceriesRepository>();
  List<Grocery> groceries = [];

  @override
  void initState() {
    super.initState();

    groceries = repo.groceries();
  }

  void _newGrocery(BuildContext context) async {
    final created = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewGroceryScreen(),
      ),
    );

    if (created == null) {
      return;
    }

    setState(() {
      groceries = repo.groceries();
    });
  }

  void _removeGrocery(Grocery grocery) {
    repo.deleteGrocery(grocery);

    setState(() {
      groceries = repo.groceries();
    });
  }

  Widget mainContent(List<Grocery> groceries) {
    if (groceries.isEmpty) {
      return const Center(
        child: Text("You don't have any expenses. Start adding some!"),
      );
    } else {
      return GroceriesList(
        groceries: groceries,
        onRemoved: _removeGrocery,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
