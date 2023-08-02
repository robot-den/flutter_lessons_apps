import 'dart:async';

import 'package:crypto_rates/features/middlewares/middlewares.dart';
import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_rates/repositories/models/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto_rates/crypto_rates_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

void main() async {
  final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 80, // Width of the output
        colors: false, // Colorful log messages (for iOS you need hack)
        printEmojis: false, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );
  final dio = Dio();
  dio.interceptors.add(
    DioLoggerInterceptor(logger: logger),
  );

  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailedAdapter());

  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>('crypto_coins_box');

  Bloc.observer = BlocLoggerObserver(logger: logger);

  GetIt.I.registerLazySingleton<AbstractCryptoCoinsRepository>(
      () => CryptoCoinsRepository(dio: dio, cryptoCoinsBox: cryptoCoinsBox));
  GetIt.I.registerSingleton<Logger>(logger);

  // Catches Flutter engine errors
  FlutterError.onError = (details) {
    GetIt.I<Logger>().f('FlutterError.onError',
        error: details.exception, stackTrace: details.stack);
  };

  // Catches unhandled app errors
  runZonedGuarded(() => runApp(const CryptoRatesApp()), (error, stack) {
    GetIt.I<Logger>().f('runZonedGuarded', error: error, stackTrace: stack);
  });
}
