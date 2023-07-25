part of 'crypto_coins_list_bloc.dart';

abstract class CryptoCoinsListEvent extends Equatable {}

class LoadCryptoCoinsList extends CryptoCoinsListEvent {
  LoadCryptoCoinsList({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
