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
  bool _isLoading = true;
  bool _dataLoadingFailed = false;

  @override
  void initState() {
    super.initState();

    repo.groceries().then((value) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          groceries = value;
          repo.setLocalGroceries(value);
        });
      }
    }).catchError((error) {
      setState(() {
        _isLoading = false;
        _dataLoadingFailed = true;
      });
    });
  }

  Future<List<Grocery>> _loadGroceries() async {
    return repo.groceries();
  }

  void _newGrocery(BuildContext context) async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (ctx) => const NewGroceryScreen(),
      ),
    );

    if (result == null) {
      return;
    }

    setState(() {
      groceries = repo.localGroceries();
    });
  }

  void _removeGrocery(Grocery grocery) async {
    final index = repo.localGroceries().indexOf(grocery);

    repo.deleteLocalGrocery(grocery);
    setState(() {
      groceries = repo.localGroceries();
    });

    final removed = await repo.deleteGrocery(grocery);

    if (removed) {
      return;
    }

    repo.saveLocalGrocery(grocery, index);
    setState(() {
      groceries = repo.localGroceries();
    });

    if (context.mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text('Removing failed. Try again later'),
        ),
      );
    }
  }

  Widget mainContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_dataLoadingFailed) {
      return const Center(
        child: Text("Groceries list loading failed. Try again later."),
      );
    } else if (groceries.isEmpty) {
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
      body: mainContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _newGrocery(context),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

// final variant = FutureBuilder(
//   future: _loadGroceriesFuture,
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (snapshot.hasError) {
//       return const Center(
//         child: Text("Groceries list loading failed. Try again later."),
//       );
//     }

//     if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//       return GroceriesList(
//         groceries: snapshot.data!,
//         onRemoved: _removeGrocery,
//       );
//     }

//     return const Center(
//       child: Text("You don't have any expenses. Start adding some!"),
//     );
//   },
// );