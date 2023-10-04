import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import 'package:places/models/models.dart';

const tableName = 'places';

class PlacesRepository {
  Future<List<Place>> places() async {
    final db = GetIt.I<Database>();
    final rows = await db.query(tableName);

    return rows.map((row) => Place.fromDbFormat(row)).toList();
  }

  Future<void> savePlace(Place place) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(place.image.path);
    final copiedImage = await place.image.copy('${appDir.path}/$filename');
    place.image = copiedImage;

    final db = GetIt.I<Database>();
    db.insert(tableName, place.toDbFormat());

    _places.add(place);
  }

  void deletePlace(Place place) => _places.remove(place);
}

List<Place> _places = [];
