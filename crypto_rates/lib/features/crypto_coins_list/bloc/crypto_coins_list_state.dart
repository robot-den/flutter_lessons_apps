part of 'crypto_coins_list_bloc.dart';

abstract class CryptoCoinsListState extends Equatable {}

class CryptoCoinsListInitial extends CryptoCoinsListState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinsListLoading extends CryptoCoinsListState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinsListLoaded extends CryptoCoinsListState {
  CryptoCoinsListLoaded({required this.cryptoCoinsList});

  final List<CryptoCoin> cryptoCoinsList;

  @override
  List<Object?> get props => [cryptoCoinsList];
}

class CryptoCoinsListLoadingFailed extends CryptoCoinsListState {
  CryptoCoinsListLoadingFailed({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
