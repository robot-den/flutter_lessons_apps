import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_detailed.g.dart';

@JsonSerializable()
class CryptoCoinDetailed extends Equatable {
  const CryptoCoinDetailed(
      {required this.priceInUSD,
      required this.imageUrl,
      required this.toSymbol,
      required this.lastUpdate,
      required this.hight24Hour,
      required this.low24Hours});

  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @JsonKey(
      name: 'LASTUPDATE',
      toJson: _lastUpdateToJson,
      fromJson: _lastUpdateFromJson)
  final DateTime lastUpdate;

  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com$imageUrl';

  /// Connect the generated [_$CryptoCoinDetailedFromJson] function to the `fromJson` factory.
  factory CryptoCoinDetailed.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailedFromJson(json);

  /// Connect the generated [_$CryptoCoinDetailedToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CryptoCoinDetailedToJson(this);

  static int _lastUpdateToJson(DateTime time) => time.millisecondsSinceEpoch;
  static DateTime _lastUpdateFromJson(int ms) =>
      DateTime.fromMillisecondsSinceEpoch(ms);

  @override
  List<Object> get props =>
      [toSymbol, lastUpdate, hight24Hour, low24Hours, priceInUSD, imageUrl];
}
