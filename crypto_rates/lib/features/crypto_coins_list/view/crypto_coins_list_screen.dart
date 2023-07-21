import 'package:crypto_rates/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_rates/repositories/models/models.dart';
import 'package:flutter/material.dart';
import 'package:crypto_rates/features/crypto_coins_list/widgets/widgets.dart';

class CryptoCoinsListScreen extends StatefulWidget {
  const CryptoCoinsListScreen({super.key});

  final String title = 'Crypto dogs';

  @override
  State<CryptoCoinsListScreen> createState() => _CryptoCoinsListScreenState();
}

class _CryptoCoinsListScreenState extends State<CryptoCoinsListScreen> {
  List<CryptoCoin> _cryptoCoinsList = [];

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: (_cryptoCoinsList.isEmpty)
          ? const SizedBox(child: Center(child: CircularProgressIndicator()))
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _cryptoCoinsList.length,
              itemBuilder: (context, i) =>
                  CryptoCoinsListTile(coin: _cryptoCoinsList[i])),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}
