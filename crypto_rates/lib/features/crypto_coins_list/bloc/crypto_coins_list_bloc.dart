import 'dart:async';

import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_rates/repositories/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

part 'crypto_coins_list_event.dart';
part 'crypto_coins_list_state.dart';

class CryptoCoinsListBloc
    extends Bloc<CryptoCoinsListEvent, CryptoCoinsListState> {
  CryptoCoinsListBloc(this.cryptoCoinsRepository)
      : super(CryptoCoinsListInitial()) {
    on<LoadCryptoCoinsList>(_load);
  }

  final AbstractCryptoCoinsRepository cryptoCoinsRepository;

  Future<void> _load(
      LoadCryptoCoinsList event, Emitter<CryptoCoinsListState> emit) async {
    try {
      if (state is! CryptoCoinsListLoaded) {
        emit(CryptoCoinsListLoading());
      }
      final cryptoCoinsList = await cryptoCoinsRepository.getCoinsList();
      emit(CryptoCoinsListLoaded(cryptoCoinsList: cryptoCoinsList));
    } catch (e, st) {
      emit(CryptoCoinsListLoadingFailed(exception: e));
      GetIt.I<Logger>()
          .f('Crypto coins list loading failed', error: e, stackTrace: st);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Logger>().f('Crypto coins list loading failed (onError)',
        error: error, stackTrace: stackTrace);
  }
}
