import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/features/places/view/place_details_screen.dart';
import 'package:places/models/models.dart';
import 'package:places/providers/places_provider.dart';

class DismissiblePlaceCard extends ConsumerWidget {
  const DismissiblePlaceCard({
    super.key,
    required this.place,
  });

  final Place place;

  void routeToPlaceDetailsScreen(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (ctx) => PlaceDetailsScreen(place: place)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(place),
      onDismissed: (direction) =>
          ref.read(placesProvider.notifier).deletePlace(place),
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
      child: GestureDetector(
        onTap: () => routeToPlaceDetailsScreen(context),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: FileImage(place.image),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.title,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      place.location.formattedAddress,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
