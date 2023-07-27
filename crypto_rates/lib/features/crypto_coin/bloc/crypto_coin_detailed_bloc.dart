import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_rates/repositories/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

part 'crypto_coin_detailed_event.dart';
part 'crypto_coin_detailed_state.dart';

class CryptoCoinDetailedBloc
    extends Bloc<CryptoCoinDetailedEvent, CryptoCoinDetailedState> {
  CryptoCoinDetailedBloc(this.cryptoCoinsRepository)
      : super(const CryptoCoinDetailedState()) {
    on<LoadCryptoCoinDetails>(_load);
  }

  final AbstractCryptoCoinsRepository cryptoCoinsRepository;

  Future<void> _load(LoadCryptoCoinDetails event,
      Emitter<CryptoCoinDetailedState> emit) async {
    try {
      if (state is! CryptoCoinDetailedLoaded) {
        emit(const CryptoCoinDetailedLoading());
      }

      final cryptoCoinDetailed =
          await cryptoCoinsRepository.getCoinDetails(event.currencyCode);

      emit(CryptoCoinDetailedLoaded(cryptoCoinDetailed: cryptoCoinDetailed));
    } catch (e, st) {
      emit(CryptoCoinDetailedLoadingFailed(exception: e));
      GetIt.I<Logger>()
          .f('Crypto coin details loading failed', error: e, stackTrace: st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Logger>().f('Crypto coin details loading failed (onError)',
        error: error, stackTrace: stackTrace);
  }
}
