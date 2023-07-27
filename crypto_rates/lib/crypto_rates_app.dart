import 'package:flutter/material.dart';
import 'package:crypto_rates/router/router.dart';
import 'package:crypto_rates/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'features/observers/observers.dart';

class CryptoRatesApp extends StatelessWidget {
  const CryptoRatesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
      navigatorObservers: [LoggerObserver(GetIt.I<Logger>())],
    );
  }
}
