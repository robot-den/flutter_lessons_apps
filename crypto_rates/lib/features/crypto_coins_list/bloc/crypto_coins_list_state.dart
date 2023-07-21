part of 'crypto_coins_list_bloc.dart';

class CryptoCoinsListState {}

class CryptoCoinsListInitial extends CryptoCoinsListState {}

class CryptoCoinsListLoading extends CryptoCoinsListState {}

class CryptoCoinsListLoaded extends CryptoCoinsListState {
  CryptoCoinsListLoaded({required this.cryptoCoinsList});

  final List<CryptoCoin> cryptoCoinsList;
}

class CryptoCoinsListLoadingFailed extends CryptoCoinsListState {
  CryptoCoinsListLoadingFailed({required this.exception});

  final Object? exception;
}
