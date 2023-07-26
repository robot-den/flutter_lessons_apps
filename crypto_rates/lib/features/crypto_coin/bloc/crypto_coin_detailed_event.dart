part of 'crypto_coin_detailed_bloc.dart';

abstract class CryptoCoinDetailedEvent extends Equatable {
  const CryptoCoinDetailedEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoCoinDetails extends CryptoCoinDetailedEvent {
  const LoadCryptoCoinDetails({
    required this.currencyCode,
  });

  final String currencyCode;

  @override
  List<Object> get props => super.props..add(currencyCode);
}
