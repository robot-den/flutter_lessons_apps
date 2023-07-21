import 'package:flutter/material.dart';
import 'package:crypto_rates/features/crypto_coins_list/widgets/widgets.dart';

class CryptoCoinsListScreen extends StatefulWidget {
  const CryptoCoinsListScreen({super.key});

  final String title = 'Crypto dogs';

  @override
  State<CryptoCoinsListScreen> createState() => _CryptoCoinsListScreenState();
}

class _CryptoCoinsListScreenState extends State<CryptoCoinsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
          itemBuilder: (context, i) {
            String coinName = 'Bitcoin $i';

            return CryptoCoinsListTile(coinName: coinName);
          }),
    );
  }
}
