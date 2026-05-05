import 'package:crypto_app/src/core/data/api/model/resp/coins_response.dart';
import 'package:crypto_app/src/core/domain/model/coin.dart';
import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';
import 'package:crypto_app/src/core/domain/model/quote.dart';
import 'package:crypto_app/src/core/domain/model/resp/coins_response.dart';
import 'package:crypto_app/src/core/domain/model/resp/coins_response_status.dart';

class CoinsResponseMapper {
  const CoinsResponseMapper._();

  static CoinsResponse toModel(CoinsResponseDto dto) {
    return CoinsResponse(
      status: _CoinsResponseStatusMapper.toModel(dto.status),
      coins: dto.data.map(_CoinMapper.toModel).toList(),
    );
  }
}

class _CoinsResponseStatusMapper {
  const _CoinsResponseStatusMapper._();

  static CoinsResponseStatus toModel(StatusDto dto) {
    return CoinsResponseStatus(
      timestamp: DateTime.parse(dto.timestamp).toUtc(),
      errorCode: dto.errorCode,
      errorMessage: dto.errorMessage,
      elapsed: dto.elapsed,
      creditCount: dto.creditCount,
    );
  }
}

class _CoinMapper {
  const _CoinMapper._();

  static Coin toModel(CoinDto dto) {
    return Coin(
      id: dto.id,
      name: dto.name,
      symbol: dto.symbol,
      slug: dto.slug,
      cmcRank: dto.cmcRank,
      circulatingSupply: dto.circulatingSupply,
      maxSupply: dto.maxSupply,
      lastUpdated: DateTime.parse(dto.lastUpdated).toUtc(),
      quotes: _QuoteMapper.toModel(dto.quote),
    );
  }
}

class _QuoteMapper {
  const _QuoteMapper._();

  static List<Quote> toModel(Map<String, QuoteDto> map) {
    return map.entries.map((e) {
      final key = e.key;
      final value = e.value;
      return Quote(
        ticker: CurrencyTicker.values.byName(key.toLowerCase()),
        price: value.price,
        volume24h: value.volume24h,
        percentChange24h: value.percentChange24h,
        marketCap: value.marketCap,
        lastUpdated: DateTime.parse(value.lastUpdated).toUtc(),
      );
    },).toList();
  }
}
