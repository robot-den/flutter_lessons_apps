import 'package:flutter/material.dart';

import 'package:places/theme/theme.dart';
import 'package:places/features/places/view/places_list_screen.dart';

class PlacesApp extends StatelessWidget {
  const PlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const PlacesListScreen(),
    );
  }
}
