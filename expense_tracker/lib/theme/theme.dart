import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

var mainTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
);

var darkTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kDarkColorScheme,
);
