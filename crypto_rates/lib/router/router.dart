import 'package:auto_route/auto_route.dart';
import 'package:crypto_rates/features/crypto_coins_list/crypto_coins_list.dart';
import 'package:crypto_rates/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_rates/repositories/models/models.dart';
import 'package:flutter/material.dart';

// final routes = {
//   '/': (context) => const CryptoCoinsListScreen(),
//   '/coin': (context) => const CryptoCoinScreen(),
// };

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CryptoCoinsListRoute.page, path: '/'),
        AutoRoute(page: CryptoCoinRoute.page)
      ];
}
