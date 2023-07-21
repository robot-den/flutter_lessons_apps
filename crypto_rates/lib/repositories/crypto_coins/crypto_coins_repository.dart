import 'package:crypto_rates/repositories/models/models.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,DOGE&tsyms=USD');

    debugPrint('rates are loaded: ${response.toString()}');

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
}
