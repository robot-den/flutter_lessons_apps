import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:places/models/models.dart';
import 'package:places/repositories/places_repository.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super([]);

  final repo = GetIt.I<PlacesRepository>();

  void savePlace(Place place) async {
    await repo.savePlace(place);
    state = repo.places();
  }

  void deletePlace(Place place) {
    repo.deletePlace(place);
    state = repo.places();
  }
}

final placesProvider =
    StateNotifierProvider<PlacesNotifier, List<Place>>((ref) {
  return PlacesNotifier();
});
