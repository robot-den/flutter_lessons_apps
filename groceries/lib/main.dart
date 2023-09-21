import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:groceries/grocery_app.dart';
import 'package:groceries/repositories/grocery/groceries_repository.dart';

void main() {
  GetIt.I.registerSingleton<AbstractGroceriesRepository>(
    LocalGroceriesRepository(),
  );

  runApp(const GroceryApp());
}
