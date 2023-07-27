import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto_rates/crypto_rates_app.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCryptoCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio()));
  GetIt.I.registerLazySingleton<Logger>(() => Logger(
        printer: PrettyPrinter(
            methodCount: 3, // Number of method calls to be displayed
            errorMethodCount:
                8, // Number of method calls if stacktrace is provided
            lineLength: 80, // Width of the output
            colors: false, // Colorful log messages
            printEmojis: false, // Print an emoji for each log message
            printTime: false // Should each log print contain a timestamp
            ),
      ));

  runApp(const CryptoRatesApp());
}
