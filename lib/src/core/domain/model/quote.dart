import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';

class Quote {
  final CurrencyTicker ticker;
  final double price;
  final double volume24h;
  final double percentChange24h;
  final double marketCap;
  final DateTime lastUpdated;

  Quote({
    required this.ticker,
    required this.price,
    required this.volume24h,
    required this.percentChange24h,
    required this.marketCap,
    required this.lastUpdated,
  });
}