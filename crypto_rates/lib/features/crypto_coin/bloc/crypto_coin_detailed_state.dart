part of 'crypto_coin_detailed_bloc.dart';

class CryptoCoinDetailedState extends Equatable {
  const CryptoCoinDetailedState();

  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailedLoading extends CryptoCoinDetailedState {
  const CryptoCoinDetailedLoading();
}

class CryptoCoinDetailedLoaded extends CryptoCoinDetailedState {
  const CryptoCoinDetailedLoaded({required this.cryptoCoinDetailed});

  final CryptoCoin cryptoCoinDetailed;

  @override
  List<Object?> get props => [cryptoCoinDetailed];
}

class CryptoCoinDetailedLoadingFailed extends CryptoCoinDetailedState {
  const CryptoCoinDetailedLoadingFailed({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}
