import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/features/places/view/new_place_screen.dart';
import 'package:places/features/places/widgets/widgets.dart';
import 'package:places/providers/places_provider.dart';

class PlacesListScreen extends ConsumerStatefulWidget {
  const PlacesListScreen({super.key});

  @override
  ConsumerState<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends ConsumerState<PlacesListScreen> {
  void routeToNewPlaceScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const NewPlaceScreen()),
    );
  }

  Widget get noContent {
    return const Center(
      child: Text(
        'No places added yet',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Places list')),
      body: places.isEmpty
          ? noContent
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (ctx, index) {
                return DismissiblePlaceCard(place: places[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: routeToNewPlaceScreen,
        child: const Icon(Icons.add, size: 20),
      ),
    );
  }
}
