import 'package:crypto_rates/repositories/models/models.dart';
import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CryptoCoinsRepository implements AbstractCryptoCoinsRepository {
  CryptoCoinsRepository({required this.dio, required this.cryptoCoinsBox});

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var coinsList = <CryptoCoin>[];

    try {
      coinsList = await _fetchCoinsListFromApi();

      final cryptoCoinsAsMap = {for (var coin in coinsList) coin.name: coin};

      await cryptoCoinsBox.putAll(cryptoCoinsAsMap);
    } catch (e) {
      if (cryptoCoinsBox.values.isEmpty) {
        rethrow;
      }

      coinsList = cryptoCoinsBox.values.toList();
    }

    coinsList.sort((a, b) => a.name.compareTo(b.name));
    return coinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinsListFromApi() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,DOGE,XRP,TRX,MATIC&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final coinsList = dataRaw.entries.map((e) {
      final dataUSD =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CryptoCoinDetailed.fromJson(dataUSD);

      return CryptoCoin(name: e.key, details: details);
    }).toList();
    return coinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    try {
      final CryptoCoin cryptoCoinDetailed =
          await _fetchCoinDetailsFromApi(currencyCode);
      cryptoCoinsBox.put(cryptoCoinDetailed.name, cryptoCoinDetailed);
      return cryptoCoinDetailed;
    } catch (e) {
      CryptoCoin? cryptoCoin = cryptoCoinsBox.get(currencyCode);
      if (cryptoCoin == null) {
        rethrow;
      }

      return cryptoCoin;
    }
  }

  Future<CryptoCoin> _fetchCoinDetailsFromApi(String currencyCode) async {
    final String url =
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD';
    final response = await dio.get(url);

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetailed.fromJson(usdData);

    return CryptoCoin(
      name: currencyCode,
      details: details,
    );
  }
}
