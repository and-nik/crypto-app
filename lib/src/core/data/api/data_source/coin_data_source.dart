import 'package:crypto_app/src/core/data/api/model/resp/coins_response.dart';
import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';

abstract class CoinDataSource {
  Future<CoinsResponseDto> list({
    required int start,
    required int limit,
    String convert = CurrencyTicker.usdStr,
  });
}