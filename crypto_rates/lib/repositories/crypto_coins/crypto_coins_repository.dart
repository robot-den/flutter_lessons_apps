import 'package:crypto_rates/repositories/models/models.dart';
import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCryptoCoinsRepository {
  CryptoCoinsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,DOGE,XRP,TRX,MATIC&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final coinsList = dataRaw.entries.map((e) {
      final dataUSD =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;

      double? priceInUSD = dataUSD['PRICE'];
      priceInUSD ??= 0.0;
      String imageUrl = dataUSD['IMAGEURL'].toString();

      return CryptoCoin(
          name: e.key,
          priceInUSD: priceInUSD,
          imageUrl: 'https://www.cryptocompare.com$imageUrl');
    }).toList();

    return coinsList;
  }

  @override
  Future<CryptoCoinDetailed> getCoinDetails(String currencyCode) async {
    final String url =
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD';
    final response = await dio.get(url);

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;

    final price = usdData['PRICE'];
    final imageUrl = usdData['IMAGEURL'];
    final toSymbol = usdData['TOSYMBOL'];
    final lastUpdate = usdData['LASTUPDATE'];
    final hight24Hour = usdData['HIGH24HOUR'];
    final low24Hours = usdData['LOW24HOUR'];

    return CryptoCoinDetailed(
      name: currencyCode,
      priceInUSD: price,
      imageUrl: 'https://www.cryptocompare.com$imageUrl',
      toSymbol: toSymbol,
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
      hight24Hour: hight24Hour,
      low24Hours: low24Hours,
    );
  }
}
