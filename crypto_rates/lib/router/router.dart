import 'package:crypto_rates/features/crypto_coins_list/crypto_coins_list.dart';
import 'package:crypto_rates/features/crypto_coin/crypto_coin.dart';

final routes = {
  '/': (context) => const CryptoCoinsListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
};
