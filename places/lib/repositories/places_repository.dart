import 'package:places/models/models.dart';

class PlacesRepository {
  List<Place> places() => List.of(_places);
  void savePlace(Place place) => _places.add(place);
  void deletePlace(Place place) => _places.remove(place);
}

List<Place> _places = [];
