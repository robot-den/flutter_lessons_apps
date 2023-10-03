import 'package:places/models/models.dart';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class PlacesRepository {
  List<Place> places() => List.of(_places);
  Future<void> savePlace(Place place) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(place.image.path);
    final copiedImage = await place.image.copy('${appDir.path}/$filename');
    place.image = copiedImage;

    _places.add(place);
  }

  void deletePlace(Place place) => _places.remove(place);
}

List<Place> _places = [];
