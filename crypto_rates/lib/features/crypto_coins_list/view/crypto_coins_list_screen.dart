import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_rates/features/crypto_coins_list/bloc/crypto_coins_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_rates/features/crypto_coins_list/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinsListScreen extends StatefulWidget {
  const CryptoCoinsListScreen({super.key});

  final String title = 'Crypto dogs';

  @override
  State<CryptoCoinsListScreen> createState() => _CryptoCoinsListScreenState();
}

class _CryptoCoinsListScreenState extends State<CryptoCoinsListScreen> {
  final _cryptoCoinsListBloc =
      CryptoCoinsListBloc(GetIt.I<AbstractCryptoCoinsRepository>());

  @override
  void initState() {
    _cryptoCoinsListBloc.add(LoadCryptoCoinsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoCoinsListBloc.add(LoadCryptoCoinsList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoCoinsListBloc, CryptoCoinsListState>(
            bloc: _cryptoCoinsListBloc,
            builder: (context, state) {
              if (state is CryptoCoinsListLoaded) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.cryptoCoinsList.length,
                    itemBuilder: (context, i) =>
                        CryptoCoinsListTile(coin: state.cryptoCoinsList[i]));
              } else if (state is CryptoCoinsListLoadingFailed) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Currencies loading failed.'),
                    const Text('please try again later'),
                    const SizedBox(height: 30),
                    TextButton(
                        onPressed: () {
                          _cryptoCoinsListBloc.add(LoadCryptoCoinsList());
                        },
                        child: const Text('Try again'))
                  ],
                ));
              }

              return const SizedBox(
                  child: Center(child: CircularProgressIndicator()));
            },
          ),
        ));
  }
}
