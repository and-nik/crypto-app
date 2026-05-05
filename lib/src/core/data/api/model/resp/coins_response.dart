import 'package:json_annotation/json_annotation.dart';

part 'coins_response.g.dart';

@JsonSerializable()
class CoinsResponseDto {
  final StatusDto status;
  final List<CoinDto> data;

  CoinsResponseDto({
    required this.status,
    required this.data,
  });

  factory CoinsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CoinsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CoinsResponseDtoToJson(this);
}

@JsonSerializable()
class StatusDto {
  final String timestamp;
  final int? errorCode;
  final String? errorMessage;
  final int elapsed;
  final int? creditCount;

  StatusDto({
    required this.timestamp,
    required this.errorCode,
    this.errorMessage,
    required this.elapsed,
    required this.creditCount,
  });

  factory StatusDto.fromJson(Map<String, dynamic> json) =>
      _$StatusDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StatusDtoToJson(this);

  /// Удобно для проверки
  bool get isSuccess => errorCode == 0;
}

@JsonSerializable(explicitToJson: true)
class CoinDto {
  final int id;
  final String name;
  final String symbol;
  final String slug;

  @JsonKey(name: 'cmc_rank')
  final int cmcRank;

  @JsonKey(name: 'circulating_supply')
  final double circulatingSupply;

  @JsonKey(name: 'max_supply')
  final double? maxSupply;

  @JsonKey(name: 'last_updated')
  final String lastUpdated;

  final List<QuoteDto> quote;

  const CoinDto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.cmcRank,
    required this.circulatingSupply,
    required this.maxSupply,
    required this.lastUpdated,
    required this.quote,
  });

  factory CoinDto.fromJson(Map<String, dynamic> json) =>
      _$CoinDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDtoToJson(this);
}

@JsonSerializable()
class QuoteDto {
  final String symbol;

  final double price;

  @JsonKey(name: 'volume_24h')
  final double volume24h;

  @JsonKey(name: 'percent_change_24h')
  final double percentChange24h;

  @JsonKey(name: 'market_cap')
  final double marketCap;

  @JsonKey(name: 'last_updated')
  final String lastUpdated;

  const QuoteDto({
    required this.symbol,
    required this.price,
    required this.volume24h,
    required this.percentChange24h,
    required this.marketCap,
    required this.lastUpdated,
  });

  factory QuoteDto.fromJson(Map<String, dynamic> json) =>
      _$QuoteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteDtoToJson(this);
}