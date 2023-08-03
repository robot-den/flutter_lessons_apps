import 'package:crypto_rates/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:crypto_rates/router/router.dart';
import 'package:crypto_rates/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'features/middlewares/middlewares.dart';

class CryptoRatesApp extends StatefulWidget {
  const CryptoRatesApp({super.key});

  @override
  State<CryptoRatesApp> createState() => _CryptoRatesAppState();
}

class _CryptoRatesAppState extends State<CryptoRatesApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Crypto dogs',
      theme: darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          NavigatorLoggerObserver(logger: GetIt.I<Logger>()),
        ],
      ),
    );
  }
}
