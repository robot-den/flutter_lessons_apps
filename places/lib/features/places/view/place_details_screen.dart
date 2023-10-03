import 'package:flutter/material.dart';
import 'package:places/features/places/view/map_screen.dart';
import 'package:places/models/models.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});

  final Place place;

  void routeToMapScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapScreen(
          location: place.location,
          isSelecting: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Container(
        padding: const EdgeInsets.all(1),
        child: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => routeToMapScreen(context),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          NetworkImage(place.location.staticMapUrl),
                      onBackgroundImageError: (exception, stackTrace) {
                        'unhandled logic here - we have to call setState';
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black54],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      place.location.formattedAddress,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
