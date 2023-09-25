import 'package:flutter/material.dart';
import 'package:places/models/models.dart';

class DismissiblePlaceCard extends StatelessWidget {
  const DismissiblePlaceCard({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(place),
      onDismissed: (direction) {},
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete_forever),
            ],
          ),
        ),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Row(
            children: [
              const Icon(Icons.square, color: Colors.grey),
              const SizedBox(width: 20),
              Text(place.title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
