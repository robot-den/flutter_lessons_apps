import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:places/models/models.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onLocationSelected});

  final void Function(PlaceLocation location) onLocationSelected;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _placeLocation;
  bool _isGettingLocation = false;

  void _getCurrentLocation() async {
    Location location = new Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    // NOTE: getting location data
    locationData = await location.getLocation();

    // NOTE: getting location address (not implemented)
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    if (lat == null || lng == null) {
      setState(() {
        _isGettingLocation = false;
      });
      return;
    }
    // final url =
    //     'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=API_KEY_HERE';
    // final response = dio.get(url);
    // final address = response['results'][0]['formatted_address']; // won't work

    _placeLocation = PlaceLocation(
      latitude: lat,
      longitude: lng,
      formattedAddress: 'Some address from google API',
    );

    setState(() {
      _isGettingLocation = false;
    });

    widget.onLocationSelected(_placeLocation!);
  }

  Widget get locationPreviewContent {
    if (_isGettingLocation) {
      return const CircularProgressIndicator();
    }

    if (_placeLocation == null) {
      return Text(
        'Location is not set',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }

    return const Text('not implemented');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.9),
          ),
          child: locationPreviewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Get current location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select on map'),
            ),
          ],
        )
      ],
    );
  }
}
