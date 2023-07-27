import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    primarySwatch: Colors.yellow,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 47, 60, 67),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 47, 60, 67),
    // useMaterial3: true,
    textTheme: TextTheme(
        bodyMedium: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w700,
            fontSize: 14)),
    dividerColor: Colors.white10,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white30));
