import 'package:auto_route/auto_route.dart';
import 'package:crypto_rates/features/crypto_coin/bloc/crypto_coin_detailed_bloc.dart';
import 'package:crypto_rates/features/crypto_coin/widgets/widgets.dart';
import 'package:crypto_rates/generated/l10n.dart';
import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_rates/repositories/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? coin;

  final _cryptoCoinDetailedBloc =
      CryptoCoinDetailedBloc(GetIt.I<AbstractCryptoCoinsRepository>());

  @override
  void initState() {
    _cryptoCoinDetailedBloc.add(
      LoadCryptoCoinDetails(currencyCode: widget.coin.name),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCoinDetailedBloc, CryptoCoinDetailedState>(
        bloc: _cryptoCoinDetailedBloc,
        builder: (context, state) {
          if (state is CryptoCoinDetailedLoaded) {
            final coin = state.cryptoCoinDetailed;
            final coinDetails = coin.details;

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(coinDetails.fullImageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    coin.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BaseCard(
                    child: Center(
                      child: Text(
                        '\$${coinDetails.priceInUSD}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  BaseCard(
                    child: Column(
                      children: [
                        _DataRow(
                          title: S.of(context).high24Hour,
                          value: '\$${coinDetails.hight24Hour}',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: S.of(context).low24Hour,
                          value: '\$${coinDetails.low24Hours}',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is CryptoCoinDetailedLoadingFailed) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Currency details loading failed.'),
                const Text('please try again later'),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () {
                      _cryptoCoinDetailedBloc
                          .add(LoadCryptoCoinDetails(currencyCode: coin!.name));
                    },
                    child: const Text('Try again'))
              ],
            ));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(child: Text(value)),
      ],
    );
  }
}
