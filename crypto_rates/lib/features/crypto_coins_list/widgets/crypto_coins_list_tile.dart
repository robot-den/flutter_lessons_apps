import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCoinsListTile extends StatelessWidget {
  const CryptoCoinsListTile({super.key, required this.coinName});

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin_logo.svg',
        height: 48,
        width: 48,
      ),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        "\$20000",
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin',
            arguments: <String, String>{'coinName': coinName});
      },
    );
  }
}
