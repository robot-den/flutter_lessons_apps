import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'package:places/places_app.dart';
import 'package:places/repositories/places_repository.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton<PlacesRepository>(PlacesRepository());

  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      const query =
          'CREATE TABLE places(id TEXT PRIMARY KEY, title TEXT, image_path TEXT, lat REAL, lng REAL, formatted_address TEXT)';
      return db.execute(query);
    },
    version: 1,
  );
  GetIt.I.registerSingleton<Database>(db);

  runApp(
    const ProviderScope(
      child: PlacesApp(),
    ),
  );
}
