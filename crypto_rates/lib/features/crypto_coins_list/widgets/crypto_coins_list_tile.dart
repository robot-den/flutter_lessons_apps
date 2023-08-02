import 'package:flutter/material.dart';
import 'package:crypto_rates/repositories/models/models.dart';

class CryptoCoinsListTile extends StatelessWidget {
  const CryptoCoinsListTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Image.network(
        coin.details.fullImageUrl,
        height: 48,
        width: 48,
      ),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '\$${coin.details.priceInUSD}',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}
