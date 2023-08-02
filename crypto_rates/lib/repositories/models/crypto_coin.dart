import 'package:crypto_rates/repositories/models/crypto_coin_detailed.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable {
  const CryptoCoin({required this.name, required this.details});

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetailed details;

  @override
  List<Object> get props => [name, details];
}
