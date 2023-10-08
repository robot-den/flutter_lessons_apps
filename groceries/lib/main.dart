import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries/features/middlewares/dio_logger_interceptor.dart';
import 'package:groceries/repositories/auth/auth_repository.dart';
import 'package:logger/logger.dart';

import 'package:groceries/grocery_app.dart';
import 'package:groceries/repositories/grocery/groceries_repository.dart';

void main() {
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

  GetIt.I.registerSingleton<AbstractGroceriesRepository>(
    LocalGroceriesRepository(dio: dio),
  );
  GetIt.I.registerSingleton<AuthRepository>(
    AuthRepository(dio: dio),
  );

  runApp(const ProviderScope(
    child: GroceryApp(),
  ));
}
