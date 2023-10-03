import 'package:flutter/material.dart';

import 'package:places/models/models.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation.initial(),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Select location' : 'Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
        ],
      ),
      body: const Center(
        child: Text(
          'Imagine google maps here :)',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
