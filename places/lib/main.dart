import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'package:places/places_app.dart';
import 'package:places/repositories/places_repository.dart';

void main() {
  GetIt.I.registerSingleton<PlacesRepository>(PlacesRepository());

  runApp(
    const ProviderScope(
      child: PlacesApp(),
    ),
  );
}
