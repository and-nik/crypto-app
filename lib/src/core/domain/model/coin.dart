import 'package:crypto_app/src/core/data/api/const/api_const.dart';
import 'package:crypto_app/src/core/domain/model/quote.dart';

enum CoinImageSize {
  x16(16),
  x32(32),
  x64(64),
  x128(128),
  x200(200);

  final int size;

  String get squareSize => "${size}x$size";

  const CoinImageSize(this.size);
}

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

  String iconUrl([CoinImageSize size = .x64]) =>
      ApiConst.iconUrl(size.squareSize, id);

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