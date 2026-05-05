import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';
import 'package:crypto_app/src/core/domain/model/resp/coins_response.dart';

abstract class CoinRepo {
  Future<CoinsResponse> list({
    required int start,
    required int limit,
    String convert = CurrencyTicker.usdStr,
  });
}