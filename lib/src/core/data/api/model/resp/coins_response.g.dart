// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinsResponse _$CoinsResponseFromJson(Map<String, dynamic> json) =>
    CoinsResponse(
      status: StatusDto.fromJson(json['status'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => CoinDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoinsResponseToJson(CoinsResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

StatusDto _$StatusDtoFromJson(Map<String, dynamic> json) => StatusDto(
  timestamp: json['timestamp'] as String,
  errorCode: (json['errorCode'] as num).toInt(),
  errorMessage: json['errorMessage'] as String?,
  elapsed: (json['elapsed'] as num).toInt(),
  creditCount: (json['creditCount'] as num).toInt(),
);

Map<String, dynamic> _$StatusDtoToJson(StatusDto instance) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'errorCode': instance.errorCode,
  'errorMessage': instance.errorMessage,
  'elapsed': instance.elapsed,
  'creditCount': instance.creditCount,
};

CoinDto _$CoinDtoFromJson(Map<String, dynamic> json) => CoinDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  symbol: json['symbol'] as String,
  slug: json['slug'] as String,
  cmcRank: (json['cmc_rank'] as num).toInt(),
  circulatingSupply: (json['circulating_supply'] as num).toDouble(),
  maxSupply: (json['max_supply'] as num?)?.toDouble(),
  lastUpdated: json['last_updated'] as String,
  quote: (json['quote'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, QuoteDto.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$CoinDtoToJson(CoinDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'symbol': instance.symbol,
  'slug': instance.slug,
  'cmc_rank': instance.cmcRank,
  'circulating_supply': instance.circulatingSupply,
  'max_supply': instance.maxSupply,
  'last_updated': instance.lastUpdated,
  'quote': instance.quote.map((k, e) => MapEntry(k, e.toJson())),
};

QuoteDto _$QuoteDtoFromJson(Map<String, dynamic> json) => QuoteDto(
  price: (json['price'] as num).toDouble(),
  volume24h: (json['volume_24h'] as num).toDouble(),
  percentChange24h: (json['percent_change_24h'] as num).toDouble(),
  marketCap: (json['market_cap'] as num).toDouble(),
  lastUpdated: json['last_updated'] as String,
);

Map<String, dynamic> _$QuoteDtoToJson(QuoteDto instance) => <String, dynamic>{
  'price': instance.price,
  'volume_24h': instance.volume24h,
  'percent_change_24h': instance.percentChange24h,
  'market_cap': instance.marketCap,
  'last_updated': instance.lastUpdated,
};
