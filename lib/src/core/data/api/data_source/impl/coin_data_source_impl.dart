import 'package:crypto_app/src/core/data/api/data_source/coin_data_source.dart';
import 'package:crypto_app/src/core/data/api/exception/api_exception_handler.dart';
import 'package:crypto_app/src/core/data/api/model/resp/coins_response.dart';
import 'package:crypto_app/src/core/data/api/service/coin_service.dart';
import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CoinDataSource)
class CoinDataSourceImpl extends CoinDataSource {

  final ApiExceptionHandler _handler;
  final CoinService _coinService;

  CoinDataSourceImpl(this._handler, this._coinService);

  @override
  Future<CoinsResponseDto> list({
    required int start,
    required int limit,
    String convert = CurrencyTicker.usdStr,
  }) async {
    try {
      final resp = await _coinService.list(
        start: start,
        limit: limit,
        convert: convert,
      );
      return resp;
    } catch (e, s) {
      throw _handler.handle(e, s);
    }
  }

}