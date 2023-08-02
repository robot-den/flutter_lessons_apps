import 'package:crypto_rates/repositories/models/crypto_coin_detailed.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({required this.name, required this.details});

  final String name;
  final CryptoCoinDetailed details;

  @override
  List<Object> get props => [name, details];
}
