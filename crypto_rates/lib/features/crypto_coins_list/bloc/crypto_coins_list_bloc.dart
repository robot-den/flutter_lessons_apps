import 'package:crypto_rates/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_rates/repositories/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coins_list_event.dart';
part 'crypto_coins_list_state.dart';

class CryptoCoinsListBloc
    extends Bloc<CryptoCoinsListEvent, CryptoCoinsListState> {
  CryptoCoinsListBloc(this.cryptoCoinsRepository)
      : super(CryptoCoinsListInitial()) {
    on<LoadCryptoCoinsList>((event, emit) async {
      try {
        final cryptoCoinsList = await cryptoCoinsRepository.getCoinsList();
        emit(CryptoCoinsListLoaded(cryptoCoinsList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoCoinsListLoadingFailed(exception: e));
      }
    });
  }

  final AbstractCryptoCoinsRepository cryptoCoinsRepository;
}
