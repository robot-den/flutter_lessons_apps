import 'package:crypto_rates/repositories/models/models.dart';

abstract class AbstractCryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetailed> getCoinDetails(String currencyCode);
}
