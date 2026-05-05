import 'package:crypto_app/src/core/domain/model/quote.dart';

class Coin {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int? cmcRank;
  final double? circulatingSupply;
  final double? maxSupply;
  final DateTime lastUpdated;

  /// Котируемая валюта
  /// В торговой паре всегда есть две части: Base (базовая) и Quote (котируемая).
  /// Пара: BTC/USD
  /// Base: BTC (что мы покупаем/продаем)
  /// Quote: USD (в чем измеряется цена)
  final List<Quote> quotes;

  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.cmcRank,
    required this.circulatingSupply,
    required this.maxSupply,
    required this.lastUpdated,
    required this.quotes,
  });
}