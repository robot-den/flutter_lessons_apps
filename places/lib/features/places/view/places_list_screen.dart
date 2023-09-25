import 'package:flutter/material.dart';
import 'package:places/features/places/view/new_place_screen.dart';
import 'package:places/features/places/widgets/widgets.dart';
import 'package:places/models/models.dart';

class PlacesListScreen extends StatefulWidget {
  const PlacesListScreen({super.key});

  @override
  State<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  void routeToNewPlaceScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const NewPlaceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Place> places = [];

    return Scaffold(
      appBar: AppBar(title: const Text('Places list')),
      body: ListView.builder(
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
