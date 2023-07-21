import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto_rates/crypto_rates_app.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCryptoCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoRatesApp());
}
