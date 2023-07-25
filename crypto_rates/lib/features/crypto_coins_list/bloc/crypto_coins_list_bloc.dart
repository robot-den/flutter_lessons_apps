import 'dart:async';

import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_rates/repositories/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'crypto_coins_list_event.dart';
part 'crypto_coins_list_state.dart';

class CryptoCoinsListBloc
    extends Bloc<CryptoCoinsListEvent, CryptoCoinsListState> {
  CryptoCoinsListBloc(this.cryptoCoinsRepository)
      : super(CryptoCoinsListInitial()) {
    on<LoadCryptoCoinsList>((event, emit) async {
      try {
        if (state is! CryptoCoinsListLoaded) {
          emit(CryptoCoinsListLoading());
        }

        debugPrint('LoadCryptoCoinsList is called');
        final cryptoCoinsList = await cryptoCoinsRepository.getCoinsList();
        emit(CryptoCoinsListLoaded(cryptoCoinsList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoCoinsListLoadingFailed(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCryptoCoinsRepository cryptoCoinsRepository;
}
