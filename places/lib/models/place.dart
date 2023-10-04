import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.formattedAddress,
  });

  final double latitude;
  final double longitude;
  final String formattedAddress;

  String get staticMapUrl {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&key=YOUR_API_KEY';
  }

  const PlaceLocation.initial()
      : latitude = 1,
        longitude = 1,
        formattedAddress = '';
}

class Place {
  Place({
    required this.title,
    required this.image,
    required this.location,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  File image;
  final PlaceLocation location;

  Map<String, Object?> toDbFormat() {
    return {
      'id': id,
      'title': title,
      'image_path': image.path,
      'lat': location.latitude,
      'lng': location.longitude,
      'formatted_address': location.formattedAddress,
    };
  }

  Place.fromDbFormat(Map<String, Object?> data)
      : id = data['id'] as String,
        title = data['title'] as String,
        image = File(data['image_path'] as String),
        location = PlaceLocation(
          latitude: data['lat'] as double,
          longitude: data['lng'] as double,
          formattedAddress: data['formatted_address'] as String,
        );
}
