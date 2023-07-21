import 'package:flutter/material.dart';
import 'package:crypto_rates/router/router.dart';
import 'package:crypto_rates/theme/theme.dart';

class CryptoRatesApp extends StatelessWidget {
  const CryptoRatesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
    );
  }
}
